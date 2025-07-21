import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../controllers/customer_restaurant_profile_controller.dart';
import 'customer_review_list.dart';

class CustomerRestaurantReview extends StatelessWidget {
  CustomerRestaurantReview({super.key});
  final controller = Get.put(CustomerRestaurantProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Row(
            children: [
              CustomText(
                text: "Reviews ",
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text:
                    "(${controller.restaurantModel.value?.data?.result?.food?.fold(0, (sum, food) => sum + (food.review?.length ?? 0)) ?? 0})",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff747474),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Expanded(child: CustomerReviewList()),
      ],
    );
  }
}
