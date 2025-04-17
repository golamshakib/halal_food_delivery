import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../widgets/owner_delivery_list.dart';
import '../widgets/owner_order_details.dart';

class OwnerOrderDetailsScreen extends StatelessWidget {
  const OwnerOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Delivery Request"),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 16.h,
              bottom: 80.h, // Space for the bottom button
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OwnerOrderDetails(),
                CustomText(
                  text: "Nearby Delivery Partner",
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 16.h),
                OwnerDeliveryList(),
                SizedBox(height: 16.h),
              ],
            ),
          ),

          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 24.h,
            child: CustomButton(
              onPressed: () {
                Get.back();
              },
              text: "Done",
              isIcon: true,
              icon: Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}
