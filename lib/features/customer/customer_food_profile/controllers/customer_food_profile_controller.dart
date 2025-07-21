import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halal_food_delivery/core/utils/constants/app_snackbar.dart';

import '../../../../core/services/Auth_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../../../core/utils/logging/logger.dart';
import '../model/single_food_model.dart';

class CustomerFoodProfileController extends GetxController {
  final initialPosition = LatLng(40.7128, -74.0060).obs;
  late final PageController pageController;
  final selectedTab = 0.obs;
  final isLoading = false.obs;

  final singleFoodModel = Rxn<SingleFoodModel>();
  
  final userPosition = Rxn<Position>();
  final markers = <Marker>{}.obs;
  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    _getUserLocation();
    
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _fitMapToMarkers();
  }

  void changeTab(int tab) {
    selectedTab.value = tab;
    pageController.animateToPage(
      tab,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    mapController?.dispose();
    super.onClose();
  }

  Future<void> fetchSingleFood(String id) async {
    isLoading.value = true;
    singleFoodModel.value = null;
    try {
      final response = await NetworkCaller().getRequest(
        "${AppUrls.singleFood}/$id",
        token: "Bearer ${AuthService.token}",
      );
      if (response.isSuccess) {
        singleFoodModel.value = SingleFoodModel.fromJson(response.responseData);
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

    if (singleFoodModel.value?.data?.nearestRestaurant?.isEmpty ?? true) {
      markers.add(
        Marker(
          markerId: MarkerId("no_restaurants"),
          position: initialPosition.value,
          infoWindow: InfoWindow(title: "No Nearby Restaurants"),
        ),
      );
    } else {
      for (var restaurant in singleFoodModel.value!.data!.nearestRestaurant!) {
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
