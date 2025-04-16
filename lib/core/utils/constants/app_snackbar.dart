import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

class AppSnackBar {
  static void showError(String message, {String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withAlpha(230),
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 3),
      icon: Icon(Icons.error_outline, color: Colors.white, size: 30.h),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static void showSuccess(String message, {String title = 'Success'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withAlpha(230),
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 3),
      icon: Icon(Icons.error_outline, color: Colors.white, size: 30.h),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
