import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/app_snackbar.dart';
import '../../../core/utils/constants/app_urls.dart';
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/logging/logger.dart';
import '../../../routes/app_routes.dart';
import '../presentation/screens/create_password_screen.dart';

class VerifyController extends GetxController {
  final TextEditingController otpController = TextEditingController();

  var isResendEnabled = false.obs;
  var start = 30.obs;
  Timer? _timer;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
    resetState();
  }

  void resetState() {
    otpController.clear();
    startTimer();
  }

  void startTimer() {
    isResendEnabled.value = false;
    start.value = 30;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start.value <= 0) {
        isResendEnabled.value = true;
        timer.cancel();
      } else {
        start.value--;
      }
    });
  }

  Future<void> resendOtp(String email) async {
    isLoading.value = true;
    try {
      final response = await NetworkCaller().postRequest(
        AppUrls.resendOtp,
        body: {'email': email},
      );
      if (response.isSuccess) {
        log('OTP resent successfully');
        AppSnackBar.showSuccess("OTP resent successfully");
        resetState();
      } else {
        final message = "Failed to resend OTP";
        log('OTP resend failed: $message');
        AppSnackBar.showError(message);
      }
    } catch (e) {
      log('Error resending OTP: $e');
      AppLoggerHelper.error('Error resending OTP: $e');
      AppSnackBar.showError("An error occurred while resending OTP");
    } finally {
      isLoading.value = false;
      log('isLoading set to false');
    }
  }

  Future<void> verifyOtp(String email, Screen screen) async {
    final otp = otpController.text.trim();
    isLoading.value = true;
    try {
      final response = await NetworkCaller().postRequest(
        AppUrls.verifyOtp,
        body: {'otp': int.parse(otp), 'email': email},
      );
      if (response.statusCode == 200) {
        log('OTP verified successfully');

        String? accesstoken = response.responseData['data'];
        if (screen == Screen.singUp) {
          Get.offAllNamed(AppRoute.verificationSuccessfulScreen);
        } else if (screen == Screen.forgetPassword) {
          Get.to(() => CreatePasswordScreen(accesstoken: accesstoken!));
        }
        AppSnackBar.showSuccess("OTP verified successfully");
      } else if (response.statusCode == 409) {
        AppSnackBar.showError("OTP is Incorrected");
      } else if (response.statusCode == 400) {
        AppSnackBar.showError("OTP is expired");
      }
    } catch (e) {
      log('Error verifying OTP: $e');
      AppLoggerHelper.error('Error verifying OTP: $e');
      AppSnackBar.showError("An error occurred while verifying OTP");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.dispose();
    super.onClose();
  }
}
