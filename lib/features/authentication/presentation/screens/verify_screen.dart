import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../../core/common/widgets/custom_button.dart';

import '../widgets/custom_title_bar.dart';
import '../widgets/verify_box.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;

    log("Received arguments: $arguments (type: ${arguments.runtimeType})");

    String? role;
    if (arguments is String) {
      role = arguments;
    } else if (arguments is Map) {
      role = arguments["user_email"];
    }

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
                  "Please check your phone. We have sent the verification code to your number.",
            ),
            SizedBox(height: 40.h),
            VerifyBox(),
            Spacer(),
            CustomButton(
              onPressed: () {
                if (role != null && role.isNotEmpty) {
                  Get.offAllNamed(
                    AppRoute.verificationSuccessfulScreen,
                    arguments: role,
                  );
                } else {
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
