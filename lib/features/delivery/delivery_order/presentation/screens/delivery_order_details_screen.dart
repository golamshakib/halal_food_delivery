import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../widgets/delivery_customer_information.dart';
import '../widgets/delivery_order_details.dart';

class DeliveryOrderDetailsScreen extends StatelessWidget {
  const DeliveryOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Delivery detailes"),
      body: Stack(
        children: [
          Positioned.fill(child: DeliveryOrderDetails()),
          Positioned(
            top: 223.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                border: Border(
                  top: BorderSide(width: 1, color: Color(0x080B111A)),
                  right: BorderSide(width: 1, color: Color(0x080B111A)),
                  left: BorderSide(width: 1, color: Color(0x080B111A)),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(30, 0),
                    blurRadius: 26,
                    spreadRadius: 0,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: DeliveryCustomerInformation(),
            ),
          ),
        ],
      ),
    );
  }
}
