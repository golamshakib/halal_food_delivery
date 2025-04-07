import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/create_password_controller.dart';
import '../widgets/custom_title_bar.dart';

class CreatePasswordScreen extends StatelessWidget {
  CreatePasswordScreen({super.key});
  final controller = Get.put(CreatePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
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
            CustomButton(
              onPressed: () => Get.toNamed(AppRoute.successfulScreen),
              text: "Change Password",
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
