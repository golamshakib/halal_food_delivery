import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/app_snackbar.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../core/utils/constants/app_urls.dart';
import '../../../routes/app_routes.dart';

class CreatePasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> resetPassword(String token) async {
    try {
      if (!formKey.currentState!.validate()) {
        log('Form validation failed');
        return;
      }

      final newPassword = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();

      if (newPassword != confirmPassword) {
        AppSnackBar.showError(AppText.passwordsDoNotMatch.tr);
        return;
      }

      isLoading.value = true;
      log('Attempting password reset with token: $token');

      final response = await NetworkCaller()
          .postRequest(
            AppUrls.resetPassword,
            body: {'password': newPassword, 'token': token},
          )
          .timeout(const Duration(seconds: 30));

      if (response.isSuccess) {
        AppSnackBar.showSuccess(AppText.passwordChangedSuccessfully.tr);
        Get.offAllNamed(AppRoute.successfulScreen);
      } else {
        AppSnackBar.showError(AppText.failedToSignUp.tr.replaceFirst('%s', ''));
      }
    } catch (e) {
      log('Reset password error: $e');
      AppSnackBar.showError(
        AppText.errorSigningUp.tr.replaceFirst('%s', e.toString()),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
