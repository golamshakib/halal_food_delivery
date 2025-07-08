import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../controllers/verify_controller.dart';
import '../widgets/custom_title_bar.dart';
import '../widgets/verify_box.dart';

class VerifyScreen extends StatelessWidget {
  final String email;
  final Role? role;
  final Screen screen;
  VerifyScreen({
    super.key,
    this.role,
    required this.screen,
    required this.email,
  });

  final controller = Get.put(VerifyController());

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
            Obx(
              () =>
                  controller.isLoading.value
                      ? SpinKitWave(color: AppColors.primary, size: 30.0)
                      : CustomButton(
                        onPressed: () {
                          controller.verifyOtp(email, screen);
                        },
                        text: "Verify",
                        isIcon: true,
                        icon: Icons.arrow_forward_outlined,
                      ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
