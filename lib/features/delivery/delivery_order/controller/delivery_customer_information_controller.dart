import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DeliveryCustomerInformationController extends GetxController {
  final otpController = TextEditingController();

  RxString otp = ''.obs;

  @override
  void onInit() {
    otpController.addListener(() {
      otp.value = otpController.text;
    });
    super.onInit();
  }
}
