import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../routes/app_routes.dart';
import 'customer_menu_list.dart';

class CustomerRestaurantDescription extends StatelessWidget {
  const CustomerRestaurantDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text:
              "Welcome to Foraged Fare, where great flavors meet warm hospitality! Located in [Location], we specialize in [cuisine type] made with fresh, high-quality ingredients. Whether you're craving classic favorites or bold new flavors, our chefs craft every dish with passion and creativity.",
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "Our Menu", fontWeight: FontWeight.w600),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.customerRestaurantMenuScreen);
              },
              child: CustomText(
                text: "See all",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        CustomerMenuList(),
      ],
    );
  }
}
