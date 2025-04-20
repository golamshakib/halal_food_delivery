import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../widgets/customer_payment_amount.dart';
import '../widgets/customer_payment_food_image.dart';
import '../widgets/customer_payment_system.dart';

class CustomerPaymentScreen extends StatelessWidget {
  const CustomerPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Payment"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CustomerPaymentFoodImage(),
                  SizedBox(height: 40.h),
                  CustomerPaymentSystem(),
                ],
              ),
            ),
            SizedBox(height: 54.h),
            Divider(color: Color(0xff808080).withAlpha(128)),
            Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [CustomerPaymentAmount()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
