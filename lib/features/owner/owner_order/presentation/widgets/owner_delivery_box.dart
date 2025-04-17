import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

class OwnerDeliveryBox extends StatelessWidget {
  final String image;
  final String foodName;
  final String star;
  final String location;
  final VoidCallback onRequestTap;

  const OwnerDeliveryBox({
    super.key,
    required this.image,
    required this.foodName,
    required this.star,
    required this.location,
    required this.onRequestTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Container(
                padding: EdgeInsets.only(
                  top: 18.h,
                  bottom: 18.h,
                  right: 8.w,
                  left: 45.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.h),
                  border: Border.all(color: Color(0xff023621).withAlpha(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha(51),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: foodName,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Icons.star,
                              color: Color(0xffFF8610),
                              size: 16.sp,
                            ),
                            SizedBox(width: 5.w),
                            CustomText(
                              text: star,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff40484E),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: onRequestTap,
                          child: Container(
                            width: 103.w,
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Color(0xffFF8610).withAlpha(25),
                              borderRadius: BorderRadius.circular(32.h),
                              border: Border.all(color: Color(0xffFF8610)),
                            ),
                            child: CustomText(
                              textAlign: TextAlign.center,
                              text: "Request",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFF8610),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 24.sp,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: CustomText(
                            text: location,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff242424),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20.h,
              left: -25.w,
              right: 271.w,
              child: Center(
                child: ClipOval(
                  child: Image.asset(
                    image,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
