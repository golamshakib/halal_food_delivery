import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/services/Auth_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/utils/constants/app_snackbar.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../../../core/utils/logging/logger.dart';
import '../../customer_food_profile/model/nearby_restaurant_model.dart';
import '../model/offer_model.dart';

class CustomerHomeController extends GetxController {
  final initialPosition = LatLng(40.7128, -74.0060).obs;
  var offerModel = Rxn<OfferModel>();
  var isLoading = false.obs;

  final nearbyRestaurantModel = Rxn<NearbyRestaurantModel>();

  final userPosition = Rxn<Position>();
  final markers = <Marker>{}.obs;
  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    _getUserLocation();
    fetchnearbyRestaurant();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _fitMapToMarkers();
  }

  Future<void> fetchMenuData() async {
    isLoading.value = true;
    try {
      final response = await NetworkCaller().getRequest(
        AppUrls.offer,
        token: "Bearer ${AuthService.token}",
      );
      if (response.isSuccess) {
        offerModel.value = OfferModel.fromJson(response.responseData);
      } else {
        AppLoggerHelper.error(
          "Failed to fetch menu: ${response.responseData['message']}",
        );
      }
    } catch (e) {
      log("Fetch menu error: $e");
      AppLoggerHelper.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchnearbyRestaurant() async {
    isLoading.value = true;
    try {
      final response = await NetworkCaller().getRequest(
        AppUrls.nearbyRestaurant,
        token: "Bearer ${AuthService.token}",
      );
      if (response.isSuccess) {
        nearbyRestaurantModel.value = NearbyRestaurantModel.fromJson(
          response.responseData,
        );
        _updateMapMarkers();
      }
    } catch (e) {
      log("Fetch menu error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AppSnackBar.showError(
        title: "Location Required",
        "Please enable location services.",
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppSnackBar.showError(
          title: "Location Required",
          "Location permissions are denied.",
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      AppSnackBar.showError(
        title: "Location Required",
        "Location permissions are permanently denied.",
      );
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );
      userPosition.value = position;
      initialPosition.value = LatLng(position.latitude, position.longitude);
      _updateMapMarkers();
    } catch (e) {
      AppLoggerHelper.error("Error getting location: $e");
      AppSnackBar.showError("Unable to get your location");
    }
  }

  void _updateMapMarkers() {
    markers.clear();
    if (userPosition.value != null) {
      markers.add(
        Marker(
          markerId: const MarkerId("user_location"),
          position: LatLng(
            userPosition.value!.latitude,
            userPosition.value!.longitude,
          ),
          infoWindow: const InfoWindow(title: "Your Location"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    }

    // Check if data is null or empty
    if (nearbyRestaurantModel.value?.data == null ||
        nearbyRestaurantModel.value!.data!.isEmpty) {
      markers.add(
        Marker(
          markerId: const MarkerId("no_restaurants"),
          position: initialPosition.value,
          infoWindow: const InfoWindow(title: "No Nearby Restaurants"),
        ),
      );
    } else {
      for (var restaurant in nearbyRestaurantModel.value!.data!) {
        if (restaurant.latitude != null && restaurant.longitude != null) {
          double? distance;
          if (userPosition.value != null) {
            distance =
                Geolocator.distanceBetween(
                  userPosition.value!.latitude,
                  userPosition.value!.longitude,
                  restaurant.latitude!,
                  restaurant.longitude!,
                ) /
                1000;
          }
          markers.add(
            Marker(
              markerId: MarkerId(restaurant.id ?? ''),
              position: LatLng(restaurant.latitude!, restaurant.longitude!),
              infoWindow: InfoWindow(
                title: restaurant.name,
                snippet:
                    distance != null
                        ? "${distance.toStringAsFixed(2)} km away"
                        : "Distance unavailable",
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRed,
              ),
            ),
          );
        }
      }
    }
    _fitMapToMarkers();
  }

  void _fitMapToMarkers() {
    if (markers.isNotEmpty && mapController != null) {
      final latitudes = markers.map((m) => m.position.latitude).toList();
      final longitudes = markers.map((m) => m.position.longitude).toList();
      final minLat = latitudes.reduce((a, b) => a < b ? a : b);
      final maxLat = latitudes.reduce((a, b) => a > b ? a : b);
      final minLng = longitudes.reduce((a, b) => a < b ? a : b);
      final maxLng = longitudes.reduce((a, b) => a > b ? a : b);
      final bounds = LatLngBounds(
        southwest: LatLng(minLat, minLng),
        northeast: LatLng(maxLat, maxLng),
      );
      mapController?.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    }
  }
}
