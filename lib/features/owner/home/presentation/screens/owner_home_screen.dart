import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/common/widgets/custom_home_app_bar.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../routes/app_routes.dart';
import '../../../owner_profile/controllers/owner_edit_profile_controller.dart';
import '../widgets/owner_menu_list.dart';
// import '../widgets/owner_order_list.dart';

class OwnerHomeScreen extends StatelessWidget {
  OwnerHomeScreen({super.key});
  final controller = Get.put(OwnerEditProfileController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProfileData();
    });
    final profile = controller.profileModel.value?.data;
    return Scaffold(
      appBar: CustomHomeAppBar(
        userName: profile?.name ?? '',
        userImageUrl: profile?.image,
        onNotification: () {
          Get.toNamed(AppRoute.ownerNotificationScreen);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "My Menu", fontWeight: FontWeight.w600),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.ownerMyOrderScreen);
                    },
                    child: CustomText(
                      text: "See all",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              OwnerMenuList(),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Orders List", fontWeight: FontWeight.w600),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.ownerOrderListScreen);
                    },
                    child: CustomText(
                      text: "See all",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              // OwnerOrderList(),
            ],
          ),
        ),
      ),
    );
  }
}
