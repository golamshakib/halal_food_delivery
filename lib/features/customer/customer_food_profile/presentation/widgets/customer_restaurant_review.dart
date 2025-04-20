import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import 'customer_review_list.dart';

class CustomerRestaurantReview extends StatelessWidget {
  const CustomerRestaurantReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              text: "Reviews ",
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: "(500)",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff747474),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Expanded(
          
          child: CustomerReviewList(),
        ),
      ],
    );
  }
}
