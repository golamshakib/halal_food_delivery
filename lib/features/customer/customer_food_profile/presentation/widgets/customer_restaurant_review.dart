import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../controllers/customer_food_profile_controller.dart';
import 'customer_review_list.dart';

class CustomerRestaurantReview extends StatelessWidget {
  const CustomerRestaurantReview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomerFoodProfileController>();
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
                text: "(${controller.singleFoodModel.value?.data?.review?.length ?? 0})",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff747474),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
         Expanded(
          child: CustomerReviewList(),
        ),
      ],
    );
  }
}