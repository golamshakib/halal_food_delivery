import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/features/customer/customer_nav_bar/controllers/customer_nav_bar_controller.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../widgets/customer_delivery_information.dart';
import '../widgets/customer_delivery_rating.dart';

class CustomerRatingScreen extends StatelessWidget {
  const CustomerRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Rating"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomerDeliveryInformation(),
              SizedBox(height: 20.h),
              CustomerDeliveryRating(),
              SizedBox(height: 38.h),
              CustomButton(
                onPressed: () {
                  Get.find<CustomerNavBarController>().changeIndex(0);
                  Get.toNamed(AppRoute.customerNavBar);
                },
                text: "Done",
                isIcon: true,
                icon: Icons.arrow_forward,
              ),
              SizedBox(height: 12.h),
              CustomButton(
                borderColor: AppColors.primary,
                iconColor: AppColors.primary,
                backgroundColor: AppColors.white,
                textColor: AppColors.primary,
                onPressed: () {
                  Get.find<CustomerNavBarController>().changeIndex(0);
                  Get.toNamed(AppRoute.customerNavBar);
                },
                text: "Skip",
                isIcon: true,
                icon: Icons.arrow_forward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
