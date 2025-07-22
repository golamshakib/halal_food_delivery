import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/Auth_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../../../core/utils/constants/enums.dart';
import '../model/food_category_model.dart';

class CustomerMenuController extends GetxController {
  final PageController pageController = PageController();
  final RxInt selectedTab = 0.obs;
  final isLoading = false.obs;

  final foodCategoryModel = Rxn<FoodCategoryModel>();

  void changeTab(int tab) {
    selectedTab.value = tab;
    pageController.animateToPage(
      tab,
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeOut,
    );
  }

  Future<void> fetchMenuByCategory(String id, Category category) async {
    isLoading.value = true;

    try {
      final response = await NetworkCaller().getRequest(
        "${AppUrls.foodRestaurant}/$id?category=${category.name}",
        token: "Bearer ${AuthService.token}",
      );
      if (response.isSuccess) {
        foodCategoryModel.value = FoodCategoryModel.fromJson(
          response.responseData,
        );
      }
    } catch (e) {
      log("Fetch menu error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
