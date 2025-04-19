import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

class CustomerCustomProductVertical extends StatelessWidget {
  final String image;
  final String foodName;
  final String price;
  final String star;

  const CustomerCustomProductVertical({
    super.key,
    required this.image,
    required this.foodName,
    required this.price,
    required this.star,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 52.h),
          child: Container(
            width: 125.w,
            padding: EdgeInsets.only(
              top: 63.h,
              bottom: 13.h,
              right: 8.w,
              left: 8.w,
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
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Color(0xffFF8610), size: 16.sp),
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
          top: 10.h,
          left: 0.w,
          right: 0.w,
          child: Center(
            child: Image.asset(
              image,
              width: 95.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
