import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final locationController = TextEditingController();

  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
