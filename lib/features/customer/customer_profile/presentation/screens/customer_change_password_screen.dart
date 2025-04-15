import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../customer_nav_bar/controllers/customer_nav_bar_controller.dart';
import '../../controllers/customer_change_password_controller.dart';

class CustomerChangePasswordScreen extends StatelessWidget {
  CustomerChangePasswordScreen({super.key});
  final controller = Get.put(CustomerChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Password Manager"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 68.h),
            CustomText(text: "Current Password"),
            SizedBox(height: 6.h),
            Obx(
              () => CustomTextField(
                obscureText: !controller.isOldPasswordVisible.value,
                controller: controller.oldPasswordController,
                hintText: "Enter your old password",
                suffixIcon: GestureDetector(
                  child: Icon(
                    controller.isOldPasswordVisible.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Color(0xff1C1C1C),
                  ),
                  onTap: () {
                    controller.toggleOldPasswordVisibility();
                  },
                ),
              ),
            ),
            SizedBox(height: 12.h),
            CustomText(text: "New Password"),
            SizedBox(height: 6.h),
            Obx(
              () => CustomTextField(
                obscureText: !controller.isNewPasswordVisible.value,
                controller: controller.newPasswordController,
                hintText: "Enter your new password",
                suffixIcon: GestureDetector(
                  child: Icon(
                    controller.isNewPasswordVisible.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Color(0xff1C1C1C),
                  ),
                  onTap: () {
                    controller.toggleNewPasswordVisibility();
                  },
                ),
              ),
            ),
            SizedBox(height: 12.h),
            CustomText(text: "Confirm New Password"),
            SizedBox(height: 6.h),
            Obx(
              () => CustomTextField(
                obscureText: !controller.isConfirmPasswordVisible.value,
                controller: controller.confirmPasswordController,
                hintText: "Enter your confirm new password",
                suffixIcon: GestureDetector(
                  child: Icon(
                    controller.isConfirmPasswordVisible.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Color(0xff1C1C1C),
                  ),
                  onTap: () {
                    controller.toggleConfirmPasswordVisibility();
                  },
                ),
              ),
            ),
            Spacer(),
            CustomButton(
              onPressed: () {
                Get.find<CustomerNavBarController>().changeIndex(3);
                Get.toNamed(AppRoute.customerNavBar);
              },
              text: "Change Password",
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
