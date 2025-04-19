import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

class CusotmerOrderDetailProduct extends StatelessWidget {
  final String image;
  final String foodName;
  final String price;
  final String star;

  const CusotmerOrderDetailProduct({
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
          padding: EdgeInsets.only(left: 20.w),
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.only(
                top: 36.h,
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
                  CustomText(
                    text: foodName,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20.h,
          left: -8.w,
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
    );
  }
}
