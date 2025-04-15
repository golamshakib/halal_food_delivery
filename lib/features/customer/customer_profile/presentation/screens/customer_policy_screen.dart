import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../widgets/customer_policy.dart';
import '../widgets/customer_terms.dart';

class CustomerPolicyScreen extends StatelessWidget {
  const CustomerPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(title: "Privacy Policy", istitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              CustomText(
                text: "Terms of Use",
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff3E3E3E),
              ),
              SizedBox(height: 16.h),
              CustomerTerms(),
              SizedBox(height: 32.h),
              CustomText(
                text: "Privacy Policy",
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff3E3E3E),
              ),
              SizedBox(height: 16.h),
              CustomerPolicy(),
            ],
          ),
        ),
      ),
    );
  }
}
