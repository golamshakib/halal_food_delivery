import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/icon_path.dart';

class DeliveryOrderProduct extends StatelessWidget {
  final String image;
  final String foodName;
  final String price;
  final String star;
  final String location;
  final bool isCompleted;
  final bool isPreparing;
  final bool isOnging;
  final VoidCallback onOngoingTap;
  final VoidCallback onPreparingTap;

  const DeliveryOrderProduct({
    super.key,
    required this.image,
    required this.foodName,
    required this.price,
    required this.star,
    required this.location,
    required this.isCompleted,
    required this.isPreparing,
    required this.isOnging,
    required this.onOngoingTap,
    required this.onPreparingTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: GestureDetector(
            onTap: onOngoingTap,
            child: Container(
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 8.h,
                right: 6.w,
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
                  CustomText(
                    text: foodName,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
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
                          SizedBox(width: 25.w),
                          Text(
                            "\$$price",
                            style: GoogleFonts.robotoSerif(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff121212),
                            ),
                          ),
                        ],
                      ),
                      if (isPreparing) ...[
                        GestureDetector(
                          onTap: onPreparingTap,
                          child: Image.asset(
                            IconPath.scan,
                            width: 32.w,
                            height: 32.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                      if (isOnging) ...[
                        Container(
                          width: 103.w,
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          decoration: BoxDecoration(
                            color: Color(0xffBFE1FF),
                            borderRadius: BorderRadius.circular(32.h),
                            border: Border.all(color: Color(0xff1F4E78)),
                          ),
                          child: CustomText(
                            textAlign: TextAlign.center,
                            text: "Ongoing",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1F4E78),
                          ),
                        ),
                      ],
                      if (isCompleted) ...[
                        Container(
                          width: 103.w,
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          decoration: BoxDecoration(
                            color: Color(0xffEDFBED),
                            borderRadius: BorderRadius.circular(32.h),
                            border: Border.all(color: Color(0xff14C71A)),
                          ),
                          child: CustomText(
                            textAlign: TextAlign.center,
                            text: "Completed",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff14C71A),
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 6.h),
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
        ),
        Positioned(
          top: 12.h,
          left: -25.w,
          right: 271.w,
          child: Center(
            child: Image.asset(
              image,
              width: 71.414.w,
              height: 75.102.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
