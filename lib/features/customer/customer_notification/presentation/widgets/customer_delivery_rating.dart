import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../controllers/customer_rating_controller.dart';

class CustomerDeliveryRating extends StatelessWidget {
  CustomerDeliveryRating({super.key});
  final controller = Get.put(CustomerRatingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "How Would You Rate This Service - "),
        SizedBox(height: 16.h),
        _buildRatingOptions(),
        SizedBox(height: 20.h),
        CustomText(text: "Write your review"),
        SizedBox(height: 16.h),
        CustomTextField(
          maxLine: 5,
          controller: controller.reviewController,
          hintText: "Write here ...",
        ),
      ],
    );
  }

  Widget _buildRatingOptions() {
    return Column(
      children: [
        _buildRatingRow("Excellent", 5),
        _buildRatingRow("Good", 4),
        _buildRatingRow("Average", 3),
        _buildRatingRow("Improvement", 2),
        _buildRatingRow("Poor", 1),
      ],
    );
  }

  Widget _buildRatingRow(String label, int starCount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: GestureDetector(
        onTap: () => controller.selectRating(label),
        child: Row(
          children: [
            // Stars on the left
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < starCount ? Icons.star : Icons.star_border_outlined,
                  color: index < starCount ? Color(0xffFF8610) : Colors.grey,
                  size: 24.sp,
                );
              }),
            ),
            SizedBox(width: 12.w),
            // Rating label text
            Expanded(child: CustomText(text: label)),
            // Checkbox/selection indicator on the right
            GetX<CustomerRatingController>(
              builder: (controller) {
                return Icon(
                  controller.selectedRating.value == label
                      ? Icons.check_box
                      : Icons.check_box_outline_blank_sharp,
                  color:
                      controller.selectedRating.value == label
                          ? AppColors.primary
                          : Colors.grey,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
