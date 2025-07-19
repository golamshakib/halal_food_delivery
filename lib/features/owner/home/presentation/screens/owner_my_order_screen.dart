import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../owner_profile/presentation/screens/owner_add_menu_screen.dart';
import '../widgets/owner_all_menu_list.dart';

class OwnerMyOrderScreen extends StatelessWidget {
  const OwnerMyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "My Menu"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "All List", fontWeight: FontWeight.w600),
                  GestureDetector(
                    onTap: () {
                      Get.to(OwnerAddMenuScreen(isAddMenu: true));
                    },
                    child: Icon(
                      Icons.add_box,
                      size: 24.sp,
                      color: Color(0xff808080),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              OwnerAllMenuList(),
            ],
          ),
        ),
      ),
    );
  }
}
