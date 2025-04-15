import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../utils/constants/app_colors.dart';
import '../widgets/custom_text.dart';

class CustomApp extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String? title;
  final bool isBack;
  final bool istitle;
  final bool isNotification;
  final Color? backgroundColor;
  final Color? color;
  final int currentStep;
  final VoidCallback? onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomApp({
    super.key,
    this.istitle = false,
    this.title,
    this.isBack = true,
    this.backgroundColor,
    this.color,
    this.currentStep = 1,
    this.isNotification = false,
    this.onPressed,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 8.w),
        color: backgroundColor ?? Colors.white,
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading:
              isBack
                  ? GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 20.sp,

                      color: Color(0xff747474),
                    ),
                  )
                  : null,
          title:
              istitle
                  ? CustomText(
                    color: color ?? AppColors.textThird,
                    text: title ?? '',
                    fontSize: fontSize ?? 16.sp,
                    fontWeight: fontWeight ?? FontWeight.w500,
                  )
                  : null,
          actions:
              isNotification
                  ? [
                    Padding(
                      padding: EdgeInsets.only(right: 20.h),
                      child: GestureDetector(
                        onTap: onPressed,
                        child: Container(
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                            color: Color(0xffE7E7E7),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications_none_outlined,
                            size: 24.sp,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ]
                  : null,
        ),
      ),
    );
  }
}
