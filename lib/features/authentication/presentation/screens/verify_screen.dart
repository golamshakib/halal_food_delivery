import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../core/common/widgets/custom_button.dart';

import '../widgets/custom_title_bar.dart';
import '../widgets/verify_box.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleBar(
              title: "Verification code",
              left: 30.w,
              subtitle:
                  "Please check your phone. We have to sent the code verification to your number.",
            ),
            SizedBox(height: 40.h), VerifyBox(),
            Spacer(),

            // Verify Button
            CustomButton(
              onPressed: () => Get.toNamed('/successfully'),
              text: "Verify",
              isIcon: true,
              icon: Icons.arrow_forward_outlined,
              backgroundColor: Color(0xff0B5D41),
              textColor: Colors.white,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
