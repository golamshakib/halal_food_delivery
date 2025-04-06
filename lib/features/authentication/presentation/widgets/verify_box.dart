import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../controllers/verify_controller.dart';

class VerifyBox extends StatelessWidget {
  VerifyBox({super.key});

  final VerifyController controller = Get.put(VerifyController());
  final List<TextEditingController> controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(5, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // OTP Text Fields
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Container(
              margin: EdgeInsets.only(right: index != 4 ? 12 : 0),
              width: 47.w,
              height: 47.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.h),
                border: Border.all(color: Colors.grey.shade300, width: 1.w),
              ),
              child: TextField(
                controller: controllers[index],
                focusNode: focusNodes[index],
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.number,
                maxLength: 1,
                decoration: InputDecoration(
                  counterText: "",
                  // border: InputBorder.none,
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    if (index < 4) {
                      FocusScope.of(
                        context,
                      ).requestFocus(focusNodes[index + 1]);
                    } else {
                      FocusScope.of(context).unfocus();
                    }
                  }
                },
                onTap: () {
                  controllers[index].selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: controllers[index].text.length,
                  );
                },
              ),
            );
          }),
        ),

        SizedBox(height: 24.h),

        Obx(
          () => Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Resend code in ',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0C0B0B),
                ),
                GestureDetector(
                  onTap:
                      controller.isClickable.value
                          ? controller.resetTimer
                          : null,
                  child: Text(
                    controller.isClickable.value
                        ? 'Resend!'
                        : controller.formatTime(
                          controller.secondsRemaining.value,
                        ),
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0C0B0B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
