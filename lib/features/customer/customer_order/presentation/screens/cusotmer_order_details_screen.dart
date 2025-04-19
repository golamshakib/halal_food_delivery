import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../widgets/cusotmer_delivery_information.dart';
import '../widgets/cusotmer_order_details.dart';

class CusotmerOrderDetailsScreen extends StatelessWidget {
  const CusotmerOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Track my order"),
      body: Stack(
        children: [
          Positioned.fill(child: CusotmerOrderDetails()),
          Positioned(
            top: 271.h,
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
              child: CusotmerDeliveryInformation(),
            ),
          ),
        ],
      ),
    );
  }
}
