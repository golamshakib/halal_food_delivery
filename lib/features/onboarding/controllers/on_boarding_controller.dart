import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  PageController pageController = PageController();

  void nextPage() {
    if (currentIndex.value < 2) {
      pageController.animateToPage(
        currentIndex.value + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onLoginPressed() {
    // Navigate to login screen
    Get.toNamed(AppRoute.loginScreen);
    log("Navigate to Login Screen");
  }

  void onRegisterPressed() {
    // Navigate to register screen
    Get.toNamed(AppRoute.roleSelectionScreen);
    log("Navigate to Register Screen");
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
