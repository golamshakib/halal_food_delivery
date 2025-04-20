import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/icon_path.dart';

import '../../../../../core/utils/constants/enums.dart';
import '../../controllers/customer_payment_controller.dart';

class CustomerPaymentSystem extends StatelessWidget {
  CustomerPaymentSystem({super.key});

  final controller = Get.put(CustomerPaymentController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text:
                controller.isPayment.value
                    ? 'Choose the Payment Method'
                    : 'Payment System',
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 16.h),
          // Payment System Section (only if isPayment is false)
          if (!controller.isPayment.value)
            GestureDetector(
              onTap: () {
                controller.selectedSystem(PaymentSystem.stripe);
                controller.isPayment(
                  true,
                ); // Set to true when Stripe is selected
              },
              child: Container(
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16.h),
                ),
                child: Row(
                  children: [
                    Image.asset(IconPath.stripe),
                    SizedBox(width: 16.w),
                    CustomText(text: 'stripe', fontSize: 17.sp),
                    Spacer(),
                    Icon(
                      controller.selectedSystem.value == PaymentSystem.stripe
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: Colors.green.shade900,
                    ),
                  ],
                ),
              ),
            ),
          if (controller.isPayment.value) ...[
            _paymentMethodTile(
              icon: Icons.credit_card,
              label: 'Credit Card',
              isSelected:
                  controller.selectedMethod.value == PaymentMethod.creditCard,
              onTap: () => controller.selectedMethod(PaymentMethod.creditCard),
            ),
            SizedBox(height: 16.h),
            _paymentMethodTile(
              icon: Icons.phone_iphone,
              label: 'Apple Pay',
              isSelected:
                  controller.selectedMethod.value == PaymentMethod.applePay,
              onTap: () => controller.selectedMethod(PaymentMethod.applePay),
            ),
          ],
        ],
      );
    });
  }

  Widget _paymentMethodTile({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.green.shade900),
            SizedBox(width: 24.w),
            CustomText(text: label, fontSize: 17.sp),
            Spacer(),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: Colors.green.shade900,
            ),
          ],
        ),
      ),
    );
  }
}
