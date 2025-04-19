import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../routes/app_routes.dart';
import '../../controllers/customer_home_controller.dart';

class CustomerSearchScreen extends StatelessWidget {
  CustomerSearchScreen({super.key});
  final controller = Get.put(CustomerHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Search"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomTextField(
          textColor: Color(0xffD9D9D9),
          borderColor: Color(0xff808080),
          controller: controller.searchController,
          hintText: "Search for food...",
          prefixIcon: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.customerSearchResultScreen);
            },
            child: Icon(Icons.search, color: Color(0xffD9D9D9), size: 24.sp),
          ),
        ),
      ),
    );
  }
}
