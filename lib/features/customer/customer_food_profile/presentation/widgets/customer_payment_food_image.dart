import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../../../../../core/utils/constants/image_path.dart';

class CustomerPaymentFoodImage extends StatelessWidget {
  const CustomerPaymentFoodImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImagePath.food,
          width: double.infinity,
          height: 187.h,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    ImagePath.restaurants,
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8.h),
                CustomText(
                  text: "Foraged Fare",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff121212).withAlpha(179),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  IconPath.fire,
                  width: 24.w,
                  height: 24.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 8.h),
                CustomText(
                  text: "135 Kcal",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff4F4F4F),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.star_rate, color: Color(0xffFF8610), size: 24.sp),
                SizedBox(width: 8.h),
                CustomText(
                  text: "4.8",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff4F4F4F),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
