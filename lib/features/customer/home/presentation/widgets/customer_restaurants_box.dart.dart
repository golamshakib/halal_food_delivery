import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

class CustomerRestaurantsBox extends StatelessWidget {
  final String image;
  final String name;
  final String star;
  final VoidCallback? onTap;

  const CustomerRestaurantsBox({
    super.key,
    required this.image,
    required this.name,
    required this.star,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            width: 157.w,
            height: 93.h,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => Image.asset(
                  image,
                  width: 157.w,
                  height: 93.h,
                  fit: BoxFit.cover,
                ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: name,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 16.w),
              Icon(Icons.star, size: 15.sp, color: Color(0xffFF8610)),
              SizedBox(width: 6.w),
              CustomText(
                text: star,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff40484E),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
