import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

class OwnerOrderProduct extends StatelessWidget {
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
  final bool isDelivery;

  const OwnerOrderProduct({
    super.key,
    required this.image,
    required this.foodName,
    required this.price,
    required this.star,
    required this.location,
    this.isCompleted = false,
    this.isPreparing = false,
    this.isOnging = false,
    required this.onOngoingTap,
    required this.onPreparingTap,
    this.isDelivery = false,
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
                          Container(
                            width: 103.w,
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Color(0xffEDFBED),
                              borderRadius: BorderRadius.circular(32.h),
                              border: Border.all(color: Color(0xff023621)),
                            ),
                            child: CustomText(
                              textAlign: TextAlign.center,
                              text: "Preparing",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff023621),
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
        ),
        if (isOnging == true) ...[
          SizedBox(height: 12.h),
          CustomButton(onPressed: onOngoingTap, text: "Scan QR Code"),
        ],
        if (isPreparing == true && isDelivery == true) ...[
          SizedBox(height: 12.h),
          CustomButton(
            onPressed: onPreparingTap,
            text: "Delivery Request",
            isIcon: true,
            icon: Icons.arrow_forward,
          ),
        ],
      ],
    );
  }
}
