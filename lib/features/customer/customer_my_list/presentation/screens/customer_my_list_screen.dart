import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../widgets/customer_my_list.dart';

class CustomerMyListScreen extends StatelessWidget {
  const CustomerMyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(isBack: false, istitle: true, title: "My List"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(children: [CustomerMyList()]),
        ),
      ),
    );
  }
}
