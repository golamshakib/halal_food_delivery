import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/features/authentication/controllers/forget_password_controller.dart';
import 'package:halal_food_delivery/features/authentication/presentation/screens/verify_screen.dart';

import '../../../../core/utils/constants/enums.dart';
import '../widgets/custom_title_bar.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final controller = Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            CustomTitleBar(
              title: "Reset password",
              subtitle: "Please enter your email to reset the password",
            ),
            CustomTextField(
              controller: controller.emailController,
              prefixIcon: Icon(Icons.email_outlined),
              hintText: "Type Your Email",
            ),
            Spacer(),
            CustomButton(
              onPressed:
                  () => Get.to(
                    () => VerifyScreen(
                      role: Role.CUSTOMER,
                      screen: Screen.forgetPassword,
                      email: controller.emailController.text,
                    ),
                  ),
              text: "Continue",
              isIcon: true,
              icon: Icons.arrow_forward_outlined,
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
