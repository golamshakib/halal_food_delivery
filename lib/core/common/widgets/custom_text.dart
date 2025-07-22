import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../utils/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Widget? child;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextAlign? textAlign;

  const CustomText({
    super.key,
    this.text,
    this.child,
    this.maxLines,
    this.textOverflow,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.decoration,
    this.decorationColor,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return child ??
        Text(
          textAlign: textAlign,
          text ?? '',
          style: GoogleFonts.inter(
            decoration: decoration,
            decorationColor: decorationColor ?? const Color(0xffA59F92),
            fontSize: fontSize ?? 16.sp,
            color: color ?? AppColors.textSecondary,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
          overflow: textOverflow,
          maxLines: maxLines,
        );
  }
}
