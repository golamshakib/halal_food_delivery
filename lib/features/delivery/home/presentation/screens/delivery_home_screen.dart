import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_home_app_bar.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../widgets/delivery_food_list.dart';

class DeliveryHomeScreen extends StatelessWidget {
  const DeliveryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(
        userName: "John Doe",
        userImageUrl: 'https://i.pravatar.cc/150?img=1',
        onNotification: () {
          Get.toNamed(AppRoute.deliveryNotificationScreen);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Orders Request",
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.deliverySeeAllRequestScreen);
                    },
                    child: CustomText(
                      text: "See all",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              DeliveryFoodList(),
            ],
          ),
        ),
      ),
    );
  }
}
