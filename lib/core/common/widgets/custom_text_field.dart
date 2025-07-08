import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../utils/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.prefixIcon,
    this.fillColor,
    this.maxLine = 1,
    this.radius = 8,
    this.hintStyle,
    this.style,
    this.showEnabledBorder = true,
    this.showFocusedBorder = true,
    this.borderColor,
    this.textColor,
    this.onChanged,
    this.onTap,
    this.color,
    this.inputFormatters,
  });

  final VoidCallback? onTap;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final bool obscureText;
  final dynamic fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLine;
  final double radius;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color? borderColor;
  final Color? textColor;
  final Color? color;
  final bool showEnabledBorder;
  final bool showFocusedBorder;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        maxLines: maxLine,
        readOnly: readOnly,
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        inputFormatters: inputFormatters,
        style:
            style ??
            GoogleFonts.inter(
              color: color ?? AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 20.h / 14.h,
            ),

        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle:
              hintStyle ??
              GoogleFonts.inter(
                color: textColor ?? AppColors.secondary,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 20.h / 14.h,
              ),
          fillColor: fillColor ?? AppColors.white,
          filled: true,
          enabledBorder:
              showEnabledBorder
                  ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? Color(0xffE0E0E0),
                      width: 0.5.w,
                    ),
                    borderRadius: BorderRadius.circular(radius),
                  )
                  : InputBorder.none,
          focusedBorder:
              showFocusedBorder
                  ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? Color(0xffE0E0E0),
                      width: 0.5.w,
                    ),
                    borderRadius: BorderRadius.circular(radius),
                  )
                  : InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 12.h,
          ),
          errorStyle: GoogleFonts.inter(
            color: Colors.redAccent,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
