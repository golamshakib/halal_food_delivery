import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';

import 'login_screen.dart';

class VerificationSuccessfulScreen extends StatelessWidget {
  const VerificationSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(ImagePath.verifysuccessful)),
            CustomText(
              text: AppText.verificationSuccessful.tr,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: CustomText(
                text: AppText.verificationSuccessfulDesc.tr,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: Color(0xff656565),
              ),
            ),
            SizedBox(height: 188.h),
            CustomButton(
              onPressed: () {
                Get.to(() => LoginScreen());
              },
              text: AppText.signIn.tr,
              isIcon: true,
              icon: Icons.arrow_forward_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
