import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/common/widgets/custom_button.dart';

class CusotmerOrderProduct extends StatelessWidget {
  final String image;
  final String foodName;
  final String price;
  final String star;
  final bool isPending;
  final bool isCompleted;
  final bool isPreparing;
  final bool isOnging;
  final VoidCallback onOngoingTap;
  final bool isDelivery;

  const CusotmerOrderProduct({
    super.key,
    required this.image,
    required this.foodName,
    required this.price,
    required this.star,
    this.isCompleted = false,
    this.isPreparing = false,
    this.isOnging = false,
    required this.onOngoingTap,
    this.isDelivery = false,
    this.isPending = false,
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
                  top: 26.h,
                  bottom: 15.h,
                  right: 15.w,
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
                        CustomText(
                          text: foodName,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
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
                        if (isPending) ...[
                          Container(
                            width: 103.w,
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Color(0xffF9F0D7),
                              borderRadius: BorderRadius.circular(32.h),
                              border: Border.all(color: Color(0xffFFC107)),
                            ),
                            child: CustomText(
                              textAlign: TextAlign.center,
                              text: "Pending",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFC107),
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
                    SizedBox(height: 10.h),
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
                          ],
                        ),
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
                  ],
                ),
              ),
            ),
            Positioned(
              top: 12.h,
              left: -15.w,
              right: 271.w,
              child: Center(
                child: ClipOval(
                  child: Image.asset(
                    image,
                    width: 71.414.w,
                    height: 75.102.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (isOnging == true && isDelivery == true) ...[
          SizedBox(height: 12.h),
          CustomButton(
            onPressed: onOngoingTap,
            text: "Order Details",
            isIcon: true,
            icon: Icons.arrow_forward,
          ),
        ],
      ],
    );
  }
}
