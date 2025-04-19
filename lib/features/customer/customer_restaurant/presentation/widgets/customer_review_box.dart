import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/common/widgets/custom_text.dart';

class CustomerReviewBox extends StatelessWidget {
  final String image;
  final String name;
  final String star;
  final String message;
  const CustomerReviewBox({
    super.key,
    required this.image,
    required this.name,
    required this.star,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      image,
                      width: 30.w,
                      height: 30.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8.h),
                  CustomText(
                    text: name,
                    fontSize: 15.sp,
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
                    text: star,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomText(
            text: message,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
