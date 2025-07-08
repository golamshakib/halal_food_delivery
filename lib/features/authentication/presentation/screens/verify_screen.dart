import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../../core/common/widgets/custom_button.dart';

import '../../../../core/utils/constants/enums.dart';
import '../widgets/custom_title_bar.dart';
import '../widgets/verify_box.dart';

class VerifyScreen extends StatelessWidget {
  final String email;
  final Role role;
  final Screen screen;
  const VerifyScreen({
    super.key,
    required this.role,
    required this.screen,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    log("Role: $role, Screen: $screen");
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleBar(
              title: "Verification code",
              left: 30.w,
              subtitle:
                  "Please check your phone. We have sent the verification code to your eamil.",
            ),
            SizedBox(height: 40.h),
            VerifyBox(email: email),
            Spacer(),
            CustomButton(
              onPressed: () {
                if (screen == Screen.singUp) {
                  Get.offAllNamed(AppRoute.verificationSuccessfulScreen);
                } else if (screen == Screen.forgetPassword) {
                  Get.toNamed(AppRoute.createPasswordScreen);
                }
              },
              text: "Verify",
              isIcon: true,
              icon: Icons.arrow_forward_outlined,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
