import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../routes/app_routes.dart';

class OwnerLogoutBottomSheet extends StatelessWidget {
  const OwnerLogoutBottomSheet({super.key});

  static void showOwnerLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 24.h),
              CustomText(
                text: "Logout",
                fontSize: 18.sp,
                color: Color(0xff242424),
              ),
              SizedBox(height: 12.h),
              Divider(color: Color(0xff000000).withAlpha(25)),
              SizedBox(height: 12.h),
              CustomText(
                textAlign: TextAlign.center,
                text: "Are you sure you want to log out?",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff797979),
              ),
              SizedBox(height: 40.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      backgroundColor: AppColors.white,
                      textColor: AppColors.textSecondary,
                      borderColor: AppColors.primary,
                      radius: 78.h,
                      onPressed: () {
                        Get.back();
                      },
                      text: "Cancel",
                    ),
                  ),
                  SizedBox(width: 11.w),
                  Expanded(
                    child: CustomButton(
                      radius: 78.h,
                      onPressed: () {
                        Get.toNamed(AppRoute.onboardingScreen);
                      },
                      text: "Yes, Logout",
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
