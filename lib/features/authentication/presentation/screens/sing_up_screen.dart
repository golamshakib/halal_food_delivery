import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/logo_path.dart';
import 'package:halal_food_delivery/features/authentication/controllers/sing_up_controller.dart';

import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.put(SingUpController());

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;

    log("Received arguments: $arguments (type: ${arguments.runtimeType})");
    final String? role = arguments is String ? arguments : null;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(LogoPath.blackLogo)),
            SizedBox(height: 50.h),
            CustomText(
              text: "Create an account",
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text:
                  "Start exploring a world of delicious meals, real-time tracking, and seamless deliveries!",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 24.h),
            CustomTextField(
              controller: controller.emailController,
              prefixIcon: Icon(Icons.email_outlined),
              hintText: "Type Your Email",
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: controller.locationController,
              prefixIcon: Icon(Icons.send_outlined),
              hintText: "Type Your Location",
            ),
            SizedBox(height: 16.h),
            Obx(
              () => CustomTextField(
                controller: controller.passwordController,
                hintText: 'Type Your Password',
                obscureText: !controller.isPasswordVisible.value,
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            CustomButton(
              onPressed: () {
                Get.toNamed(AppRoute.verifyScreen, arguments: role);
              },
              text: "Sign Up",
            ),
            SizedBox(height: 200.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Already have an account? ",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoute.loginScreen),
                  child: CustomText(
                    text: "Sign In",
                    fontSize: 14.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
