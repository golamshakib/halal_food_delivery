import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

class CustomTitleBar extends StatelessWidget {
  final String title;
  final double? left;
  final String? subtitle;
  const CustomTitleBar({
    super.key,
    required this.title,
    this.subtitle,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 16.h,
                  color: Color(0xff616161),
                ),
              ),
              SizedBox(width: 12.w),
              CustomText(text: title),
            ],
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.only(left: left ?? 12.w),
            child: CustomText(
              text: subtitle,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
