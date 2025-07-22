import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import '../../../../../core/utils/constants/app_colors.dart';

class CustomerCustomProductVertical extends StatelessWidget {
  final String image;
  final String foodName;
  final String price;
  final String star;
  final double? offerPrice;
  final VoidCallback? onTap;

  const CustomerCustomProductVertical({
    super.key,
    required this.image,
    required this.foodName,
    required this.price,
    required this.star,
    this.onTap,
    this.offerPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 52.h),
            child: Container(
              width: 200.w,
              padding: EdgeInsets.only(
                top: 63.h,
                bottom: 13.h,
                right: 8.w,
                left: 8.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7.h),
                border: Border.all(
                  color: const Color(0xff023621).withAlpha(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(51),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
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
                          Icon(
                            Icons.star,
                            color: const Color(0xffFF8610),
                            size: 16.sp,
                          ),
                          SizedBox(width: 5.w),
                          CustomText(
                            text: star,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff40484E),
                          ),
                        ],
                      ),
                      Flexible(
                        child:
                            offerPrice != null && offerPrice != 0
                                ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "\$$price",
                                        style: GoogleFonts.robotoSerif(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: AppColors.secondary,
                                          color: AppColors.secondary,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Flexible(
                                      child: Text(
                                        "\$${offerPrice!.toStringAsFixed(offerPrice!.truncateToDouble() == offerPrice ? 0 : 2)}",
                                        style: GoogleFonts.robotoSerif(
                                          fontSize:
                                              13.sp, // Reduced for clarity
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff121212),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )
                                : Text(
                                  "\$$price",
                                  style: GoogleFonts.robotoSerif(
                                    fontSize: 13.sp, // Reduced for clarity
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff121212),
                                  ),
                                  overflow: TextOverflow.ellipsis,
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
              child: ClipOval(
                child: Image.network(
                  image,
                  width: 95.w,
                  height: 100.h,
                  fit: BoxFit.fill,
                  errorBuilder:
                      (context, error, stackTrace) => Image.asset(
                        ImagePath.background,
                        width: 95.w,
                        height: 100.h,
                        fit: BoxFit.fill,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
