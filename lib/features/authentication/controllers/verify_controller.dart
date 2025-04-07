import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController otpMailController = TextEditingController();
  var isResendEnabled = false.obs;
  var start = 30.obs;
  Timer? _timer;

  String? email;
  String? fromScreen;

  @override
  void onInit() {
    super.onInit();
    startTimer();
    Future.delayed(Duration.zero, resetState);
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

  void resendOtp() {
    log("Resending OTP to $email");
    resetState();
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.dispose();
    otpMailController.dispose();
    super.onClose();
  }
}
