import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../widgets/delivery_all_food_list.dart';

class DeliverySeeAllRequestScreen extends StatelessWidget {
  const DeliverySeeAllRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(title: "Orders Request", istitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(children: [DeliveryAllFoodList()]),
        ),
      ),
    );
  }
}
