import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../../core/common/widgets/custom_button.dart';
import '../widgets/language_selection.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title: CustomText(
          text: 'Language',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff171717),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            LanguageSelection(),
            Spacer(),
            CustomButton(
              onPressed: () {
                Get.toNamed(AppRoute.onboardingScreen);
              },
              text: 'Continue',
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
