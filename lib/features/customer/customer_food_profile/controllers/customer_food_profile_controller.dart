import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/services/Auth_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../../../core/utils/logging/logger.dart';
import '../model/single_food_model.dart';

class CustomerFoodProfileController extends GetxController {
  final Rx<LatLng> initialPosition =
      const LatLng(40.7128, -74.0060).obs; // Default position
  late final PageController pageController;
  final RxInt selectedTab = 0.obs;
  final RxBool isLoading = false.obs;
  final Rx<SingleFoodModel?> singleFoodModel = Rxn<SingleFoodModel>();
  final Rx<Position?> userPosition = Rxn<Position>(); // User's current location
  final RxSet<Marker> markers = <Marker>{}.obs; // Markers for the map

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    _getUserLocation(); // Get user's location when controller initializes
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
    super.onClose();
  }

  Future<void> fetchSingleFood(String id) async {
    isLoading.value = true;
    try {
      final response = await NetworkCaller().getRequest(
        "${AppUrls.food}/$id",
        token: "Bearer ${AuthService.token}",
      );
      if (response.isSuccess) {
        singleFoodModel.value = SingleFoodModel.fromJson(response.responseData);
        _updateMapMarkers();
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

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AppLoggerHelper.error("Location services are disabled.");
      return;
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppLoggerHelper.error("Location permissions are denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      AppLoggerHelper.error("Location permissions are permanently denied.");
      return;
    }

    // Get the current position
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
    }
  }

  void _updateMapMarkers() {
    markers.clear();
    if (userPosition.value != null) {
      // Add user's location marker
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

    // Add markers for nearby restaurants
    if (singleFoodModel.value?.data?.nearestRestaurant != null) {
      for (var restaurant in singleFoodModel.value!.data!.nearestRestaurant!) {
        if (restaurant.latitude != null && restaurant.longitude != null) {
          double distance =
              Geolocator.distanceBetween(
                userPosition.value?.latitude ?? initialPosition.value.latitude,
                userPosition.value?.longitude ??
                    initialPosition.value.longitude,
                restaurant.latitude!,
                restaurant.longitude!,
              ) /
              1000; // Convert to kilometers

          markers.add(
            Marker(
              markerId: MarkerId(restaurant.id ?? ''),
              position: LatLng(restaurant.latitude!, restaurant.longitude!),
              infoWindow: InfoWindow(
                title: restaurant.name,
                snippet: "${distance.toStringAsFixed(2)} km away",
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRed,
              ),
            ),
          );
        }
      }
    }
  }
}
