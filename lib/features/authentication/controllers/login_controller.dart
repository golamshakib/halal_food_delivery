import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/services/Auth_service.dart';
import 'package:halal_food_delivery/core/utils/constants/app_snackbar.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';
import 'package:halal_food_delivery/core/utils/constants/enums.dart';

import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/app_urls.dart';
import '../../../core/utils/logging/logger.dart';
import '../../customer/customer_nav_bar/presentation/screens/customer_nav_bar.dart';
import '../../delivery/delivery_nav_bar/presentation/screens/delivery_nav_bar.dart';
import '../../owner/owner_nav_bar/presentation/screens/owner_nav_bar.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      AppSnackBar.showError(AppText.pleaseFillAllFields.tr);
      return;
    }

    try {
      isLoading.value = true;
      final Map<String, dynamic> requestBody = {
        'email': email,
        "password": password,
        // "fcmToken": PushNotificationService.fcmToken,
      };
      final response = await NetworkCaller().postRequest(
        AppUrls.login,
        body: requestBody,
      );
      if (response.statusCode == 200) {
        String? token = response.responseData['data']['accessToken'];
        String userId = response.responseData['data']['id'] ?? "";
        String roleString = response.responseData['data']['role'] ?? "";

        // Convert role string to Role enum
        Role? role;
        try {
          role = Role.values.firstWhere(
            (e) => e.toString().split('.').last == roleString,
            orElse: () => throw Exception('Invalid role: $roleString'),
          );
        } catch (e) {
          AppSnackBar.showError(AppText.invalidRoleReceived.tr);
          AppLoggerHelper.error('Invalid role: $roleString');
          return;
        }

        if (token != null) {
          await AuthService.saveToken(token, userId, role);
        } else {
          AppSnackBar.showError(AppText.invalidLoginResponse.tr);
          return;
        }

        if (role == Role.CUSTOMER) {
          Get.offAll(() => CustomerNavBar());
          AppSnackBar.showSuccess(AppText.loginSuccesful.tr);
        } else if (role == Role.RESTAURANT_OWNER) {
          Get.offAll(() => OwnerNavBar());
          AppSnackBar.showSuccess(AppText.loginSuccesful.tr);
        } else if (role == Role.DELIVERY_PARTNER) {
          Get.offAll(() => DeliveryNavBar());
          AppSnackBar.showSuccess(AppText.loginSuccesful.tr);
        }
      } else if (response.statusCode == 203) {
        AppSnackBar.showError(AppText.passwordIncorrted.tr);
      }
    } catch (e, stack) {
      AppLoggerHelper.error('Error: $e stack: $stack');
      AppSnackBar.showError(AppText.errorLoggingIn.tr);
    } finally {
      isLoading.value = false;
    }
  }
}
