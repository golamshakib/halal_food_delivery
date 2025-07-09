import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/app_snackbar.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../core/utils/constants/app_urls.dart';
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/logging/logger.dart';
import '../presentation/screens/verify_screen.dart';

class ForgetPasswordController extends GetxController {
  final emailController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> forgetPassword() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      AppSnackBar.showError(AppText.emailCannotBeEmpty.tr);
      return;
    }

    final Map<String, dynamic> requestBody = {'email': email};

    try {
      isLoading.value = true;
      final response = await NetworkCaller().postRequest(
        AppUrls.forgetPassword,
        body: requestBody,
      );

      if (response.statusCode == 200) {
        Get.to(() => VerifyScreen(screen: Screen.forgetPassword, email: email));
        AppSnackBar.showSuccess(
          AppText.otpSentSuccessfully.tr.replaceFirst('%s', email),
        );
      } else if (response.statusCode == 400) {
        AppSnackBar.showError(AppText.emailNotRegistered.tr);
      }
    } catch (e) {
      AppLoggerHelper.error('Error: $e');
      AppSnackBar.showError(AppText.errorSendingOtp.tr);
      return;
    } finally {
      isLoading.value = false;
    }
  }
}
