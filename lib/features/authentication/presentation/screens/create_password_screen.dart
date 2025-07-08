import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/validators/app_validator.dart';

import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../controllers/create_password_controller.dart';
import '../widgets/custom_title_bar.dart';

class CreatePasswordScreen extends StatelessWidget {
  final String accesstoken;
  CreatePasswordScreen({super.key, required this.accesstoken});
  final controller = Get.put(CreatePasswordController());

  @override
  Widget build(BuildContext context) {
    log("Access Token: $accesstoken");
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitleBar(
                  title: "Set New Password",
                  left: 30.w,
                  subtitle:
                      "Create your new password so you can share your memories again.",
                ),
                // SizedBox(height: 32.h),
                Obx(
                  () => CustomTextField(
                    validator: AppValidator.validatePassword,
                    controller: controller.passwordController,
                    hintText: 'New password',
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
                SizedBox(height: 16.h),
                Obx(
                  () => CustomTextField(
                    validator:
                        (value) => AppValidator.validateConfirmPassword(
                          value,
                          controller.passwordController.text,
                        ),
                    controller: controller.confirmPasswordController,
                    hintText: 'Confirm password',
                    obscureText: !controller.isConfirmPasswordVisible.value,
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                  ),
                ),
                Spacer(),
                Obx(
                  () =>
                      controller.isLoading.value
                          ? SpinKitWave(color: AppColors.primary, size: 30.0)
                          : CustomButton(
                            onPressed: () {
                              controller.resetPassword(accesstoken);
                            },
                            text: "Change Password",
                          ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
