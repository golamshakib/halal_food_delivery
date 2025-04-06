import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/icon_path.dart';
import 'package:halal_food_delivery/core/utils/constants/logo_path.dart';

import '../../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(LogoPath.appLogo),
            SizedBox(height: 47.h),
            Image.asset(LogoPath.image, width: double.infinity, height: 298.h),
            // Spacer(),
            SizedBox(height: 72.h),
            Image.asset(IconPath.loader, width: 60.w, height: 60.h),
          ],
        ),
      ),
    );
  }
}
