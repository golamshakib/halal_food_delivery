import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:halal_food_delivery/features/owner/owner_nav_bar/controllers/owner_nav_bar_controller.dart';
import 'package:halal_food_delivery/features/owner/owner_profile/controllers/owner_edit_profile_controller.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

class OwnerEditProfileScreen extends StatelessWidget {
  OwnerEditProfileScreen({super.key});
  final controller = Get.put(OwnerEditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(title: "Your Profile", istitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Container(
            padding: EdgeInsets.all(11.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.h),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withAlpha(25),
                  offset: Offset(2.w, 5.h),
                  blurRadius: 50.h,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: controller.pickImage,
                    child: Obx(() {
                      return ClipOval(
                        child:
                            controller.pickedImage.value != null
                                ? Image.file(
                                  controller.pickedImage.value!,
                                  width: 120.h,
                                  height: 120.h,
                                  fit: BoxFit.cover,
                                )
                                : Image.asset(
                                  ImagePath.background,
                                  width: 120.h,
                                  height: 120.h,
                                  fit: BoxFit.cover,
                                ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomText(text: "Name"),
                SizedBox(height: 12.h),
                CustomTextField(
                  controller: controller.nameController,
                  hintText: "Enter your name",
                ),
                SizedBox(height: 16.h),
                CustomText(text: "Location"),
                SizedBox(height: 12.h),
                CustomTextField(
                  controller: controller.locationController,
                  hintText: "Enter your location",
                ),
                SizedBox(height: 16.h),
                CustomText(text: "Description"),
                SizedBox(height: 12.h),
                CustomTextField(
                  maxLine: 3,
                  controller: controller.descriptionController,
                  hintText: "write your description...",
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  onPressed: () {
                    Get.find<OwnerNavBarController>().changeIndex(2);
                    Get.toNamed(AppRoute.ownerNavBar);
                  },
                  text: "Save",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
