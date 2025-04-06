import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../utils/constants/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool isIcon;
  final IconData? icon;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? borderColor;
  final Color? textColor;
  final double? radius;
  final Color? iconColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? vertical;
  final double? horizontal;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isIcon = false,
    this.icon,
    this.backgroundColor,
    this.gradient,
    this.borderColor,
    this.radius,
    this.textColor,
    this.iconColor,
    this.fontWeight,
    this.fontSize,
    this.vertical,
    this.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        // width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          vertical: vertical ?? 13.h,
          horizontal: horizontal ?? 10.w,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primary,
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius ?? 8.h),
          border: Border.all(
            color:
                gradient == null
                    ? (borderColor ?? Color(0xffF3F3F5))
                    : Colors.transparent,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: text,
              color: textColor ?? AppColors.textPrimary,
              fontWeight: fontWeight ?? FontWeight.w600,
              fontSize: fontSize ?? 16.sp,
              textAlign: TextAlign.center,
            ),
            if (isIcon == true) ...[
              SizedBox(width: 16.w),
              Icon(icon, size: 20.h, color: iconColor ?? AppColors.textPrimary),
            ],
          ],
        ),
      ),
    );
  }
}
