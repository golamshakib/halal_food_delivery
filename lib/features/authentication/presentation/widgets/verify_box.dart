import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../controllers/verify_controller.dart';

class VerifyBox extends StatelessWidget {
  final String email;
  VerifyBox({super.key, required this.email});

  final VerifyController controller = Get.put(VerifyController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: PinCodeTextField(
            appContext: context,
            length: 6,
            onChanged: (value) {},
            controller: controller.otpController,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(12.h),
              fieldHeight: 47.h,
              fieldWidth: 47.w,
              activeFillColor: Colors.white,
              selectedFillColor: Colors.white,
              inactiveFillColor: Colors.white,
              activeColor: Color(0xffE0E0E0),
              selectedColor: Color(0xffE0E0E0),
              inactiveColor: Color(0xffE0E0E0),
            ),
            cursorColor: AppColors.primary,
            keyboardType: TextInputType.number,
            textStyle: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
            enableActiveFill: true,
          ),
        ),
        SizedBox(height: 24.h),

        // Timer or Resend
        Obx(() {
          return Center(
            child:
                controller.isResendEnabled.value
                    ? GestureDetector(
                      onTap: () {
                        controller.resendOtp(email);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: AppText.resendCodeIn.tr,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff0C0B0B),
                          ),
                          CustomText(
                            text: AppText.resend.tr,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff0C0B0B),
                          ),
                        ],
                      ),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: AppText.resendCodeIn.tr,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0C0B0B),
                        ),
                        CustomText(
                          text:
                              '00:${controller.start.value.toString().padLeft(2, '0')}',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ],
                    ),
          );
        }),
      ],
    );
  }
}
