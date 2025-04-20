import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../controllers/customer_personal_information_controller.dart';

class CustomerPersonalInformationScreen extends StatelessWidget {
  CustomerPersonalInformationScreen({super.key});
  final controller = Get.put(CustomerPersonalInformationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Personal Information"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Enter Your Information",
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                color: Color(0xff747474).withAlpha(25),
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: Column(
                children: [
                  CustomTextField(
                    controller: controller.nameController,
                    hintText: "Type Your Name",
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    controller: controller.phoneController,
                    hintText: "Type Your Phone Number",
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    controller: controller.locationController,
                    hintText: "Type Your Location",
                    prefixIcon: Icon(Icons.navigation_outlined),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              onPressed: () {
                Get.toNamed(AppRoute.customerPaymentScreen);
              },
              text: "Next",
              isIcon: true,
              icon: Icons.arrow_forward,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
