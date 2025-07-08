
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';
import '../../common/widgets/custom_text.dart';


class AppSnackBar {
  static void showError(String message, {String? title}) {
    Get.snackbar(
      title ?? AppText.error.tr, 
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withAlpha(230),
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 3),
      icon: Icon(Icons.error_outline, color: Colors.white, size: 30.sp),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      titleText: CustomText(
        text: title ?? AppText.error.tr,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      messageText: CustomText(
        text: message,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  static void showSuccess(String message, {String? title}) {
    Get.snackbar(
      title ?? AppText.success.tr,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withAlpha(230),
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 3),
      icon: Icon(Icons.check_circle_outline, color: Colors.white, size: 30.sp),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      titleText: CustomText(
        text: title ?? AppText.success.tr, 
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      messageText: CustomText(
        text: message,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
