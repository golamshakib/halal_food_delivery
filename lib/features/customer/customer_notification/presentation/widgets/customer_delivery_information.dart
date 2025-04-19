import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';

class CustomerDeliveryInformation extends StatelessWidget {
  const CustomerDeliveryInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              ImagePath.delivery,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12.h),
          CustomText(text: "John Doe", fontSize: 18.sp),
          SizedBox(height: 4.h),
          CustomText(
            text: "Delivery Man",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xff808080),
          ),
        ],
      ),
    );
  }
}
