import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagePath.successful),
              SizedBox(height: 40.h),
              CustomText(
                textAlign: TextAlign.center,
                fontSize: 18.sp,
                text: AppText.passwordChangedSuccessfully.tr,
              ),
              SizedBox(height: 171.h),
              CustomButton(
                onPressed: () => Get.offAllNamed(AppRoute.loginScreen),
                text: AppText.signIn.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
