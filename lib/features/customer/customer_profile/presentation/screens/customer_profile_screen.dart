import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../widgets/customer_profile_details.dart';
import '../widgets/customer_profile_list.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(isBack: false, istitle: true, title: "Profile"),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 54.h),
        child: Column(
          children: [
            CustomerProfileDetails(),
            SizedBox(height: 45.h),
            CustomerProfileList(),
          ],
        ),
      ),
    );
  }
}
