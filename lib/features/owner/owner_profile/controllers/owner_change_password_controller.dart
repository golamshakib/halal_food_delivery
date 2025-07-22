import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/services/Auth_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/utils/constants/app_snackbar.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../../../core/utils/logging/logger.dart';

class OwnerChangePasswordController extends GetxController {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isOldPasswordVisible = false.obs;
  var isNewPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  RxBool isLoading = false.obs;

  void toggleOldPasswordVisibility() {
    isOldPasswordVisible.value = !isOldPasswordVisible.value;
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> changePassword() async {
    try {
      // Validate fields
      if (oldPasswordController.text.isEmpty ||
          newPasswordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        AppSnackBar.showError(AppText.pleaseFillAllFields.tr);
        return;
      }
      if (newPasswordController.text == oldPasswordController.text) {
        AppSnackBar.showError(AppText.oldAndNewPasswordSame.tr);
        return;
      }

      if (newPasswordController.text != confirmPasswordController.text) {
        AppSnackBar.showError(AppText.passwordsDoNotMatch.tr);
        return;
      }

      if (newPasswordController.text.length < 6) {
        AppSnackBar.showError(AppText.passwordMinLength.tr);
        return;
      }

      isLoading.value = true;

      final Map<String, dynamic> requestBody = {
        "oldPassword": oldPasswordController.text.trim(),
        "newPassword": newPasswordController.text.trim(),
      };

      final response = await NetworkCaller().putRequest(
        AppUrls.changePassword,
        body: requestBody,
        token: "Bearer ${AuthService.token}",
      );

      if (response.isSuccess) {
        Get.back();
        AppSnackBar.showSuccess(AppText.passwordUpdatedSuccess.tr);
        onClose();
      } else if (response.statusCode == 203) {
        AppSnackBar.showError(AppText.incorrectCurrentPassword.tr);
      } else {
        AppSnackBar.showError(AppText.failedToUpdatePassword.tr);
      }
    } catch (e) {
      AppLoggerHelper.error('Password change error: $e');
      AppSnackBar.showError(AppText.errorChangingPassword.tr);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    newPasswordController.clear();
    confirmPasswordController.clear();
    oldPasswordController.clear();
  }
}
