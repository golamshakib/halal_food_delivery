import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../../../owner/owner_profile/presentation/widgets/owner_profile_details.dart';
import '../widgets/delivery_profile_list.dart';

class DeliveryProfileScreen extends StatelessWidget {
  const DeliveryProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(isBack: false, istitle: true, title: "Profile"),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 54.h),
        child: Column(
          children: [
            OwnerProfileDetails(),
            SizedBox(height: 45.h),
            DeliveryProfileList(),
          ],
        ),
      ),
    );
  }
}
