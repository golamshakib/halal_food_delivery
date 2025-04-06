import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  RxInt secondsRemaining = 60.obs;
  RxBool isClickable = false.obs;
  RxBool showPurpleLabel = false.obs;

  late final Timer _timer;
  final isLoading = true.obs;
  String? email;
  String? fromScreen;

  @override
  void onInit() {
    if (Get.arguments != null) {
      email = Get.arguments["user_email"]; // Ensure "user_email" is a string
      fromScreen =
          Get.arguments["form_screen"]; // Ensure "form_screen" is a string
    }
    super.onInit();
    _startCountdown();
  }

  void _startCountdown() {
    // Start with 12 seconds as shown in the image
    secondsRemaining.value = 15;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        isClickable.value = true;
        _timer.cancel();
      }
    });
  }

  void resetTimer() {
    secondsRemaining.value = 60;
    isClickable.value = false;
    _startCountdown();
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
