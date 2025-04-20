import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../routes/app_routes.dart';

class CustomerPaymentAmount extends StatelessWidget {
  const CustomerPaymentAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            textAlign: TextAlign.start,
            text: "Payment Summary",
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "Subtotal", fontSize: 14.sp),
            CustomText(text: "\$75.58", fontSize: 14.sp),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "Coupon discount", fontSize: 14.sp),
            CustomText(text: "-\$5.5", fontSize: 14.sp),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "Delivery Fee", fontSize: 14.sp),
            CustomText(text: "\$5.00", fontSize: 14.sp),
          ],
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 1.h,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(
                  (constraints.constrainWidth() / 5).floor(),
                  (index) => SizedBox(
                    width: 2.w,
                    height: 2.h,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xff808080)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "Total Amount", fontSize: 14.sp),
            CustomText(
              text: "\$75.58",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xffFF8610),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        CustomButton(
          onPressed: () {
            Get.toNamed(AppRoute.customerOrderConfrimScreen);
          },
          text: "Next",
          isIcon: true,
          icon: Icons.arrow_forward,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
