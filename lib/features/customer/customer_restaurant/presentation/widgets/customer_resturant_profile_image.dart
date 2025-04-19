import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/image_path.dart';

class CustomerResturantProfileImage extends StatelessWidget {
  const CustomerResturantProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  color: Color(0xff121212),
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
        SizedBox(height: 16.h),
        Row(
          children: [
            Icon(Icons.place, color: AppColors.primary, size: 24.sp),
            SizedBox(width: 14.h),
            CustomText(
              text: " 1234 Main Street, Springfield, NY 10001, USA",
              fontSize: 14.sp,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w400,
              color: Color(0xff242424),
            ),
          ],
        ),
      ],
    );
  }
}
