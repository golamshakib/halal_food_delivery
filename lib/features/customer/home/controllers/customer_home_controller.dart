import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/services/Auth_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../../core/utils/logging/logger.dart';
import '../model/offer_model.dart';

class CustomerHomeController extends GetxController {
  
  LatLng get initialPosition => const LatLng(40.7128, -74.0060);
  var offerModel = Rxn<OfferModel>();
  var isLoading = false.obs;

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

  final List<Map<String, String>> restaurantName =
      [
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
      ].obs;
}
