import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/features/owner/owner_nav_bar/controllers/owner_nav_bar_controller.dart';
import 'package:halal_food_delivery/features/owner/owner_profile/controllers/owner_add_menu_controller.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/icon_path.dart';

class OwnerAddMenuScreen extends StatelessWidget {
  OwnerAddMenuScreen({super.key});
  final controller = Get.put(OwnerAddMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "My Menu"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Food name", fontSize: 14.sp),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: controller.foodNameController,
                hintText: "Type Your food name",
              ),
              SizedBox(height: 12.h),
              CustomText(text: "Price", fontSize: 14.sp),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: controller.priceController,
                hintText: "Select your food prices",
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  CustomText(text: "Special Offer", fontSize: 14.sp),
                  Spacer(),
                  Obx(
                    () => Checkbox(
                      value: controller.isOfferEnabled.value,
                      onChanged: (value) {
                        controller.isOfferEnabled.value = value!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Obx(
                () =>
                    controller.isOfferEnabled.value
                        ? CustomTextField(
                          controller: controller.offerController,
                          hintText: "Select your offer prices",
                        )
                        : SizedBox.shrink(),
              ),

              SizedBox(height: 12.h),
              CustomText(text: "Description", fontSize: 14.sp),
              SizedBox(height: 8.h),
              CustomTextField(
                maxLine: 3,
                controller: controller.descriptionController,
                hintText: "Type here you food description",
              ),
              SizedBox(height: 12.h),
              CustomText(text: "Upload image", fontSize: 14.sp),
              SizedBox(height: 6.h),
              GestureDetector(
                onTap: () async {
                  await controller.pickImage();
                },
                child: Obx(() {
                  final file = controller.pickedImage.value;
                  final extension = file?.path.split('.').last.toLowerCase();
                  final isImage = ['jpg', 'jpeg', 'png'].contains(extension);

                  return Container(
                    width: double.infinity,
                    height: 108.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0XFFE0E0E0)),
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child:
                        file == null
                            ? Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: "Upload",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff767676),
                                  ),
                                  SizedBox(width: 6.w),
                                  Image.asset(
                                    IconPath.image,
                                    width: 16.w,
                                    height: 16.h,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            )
                            : isImage
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8.h),
                              child: Image.file(
                                file,
                                width: double.infinity,
                                height: 108.h,
                                fit: BoxFit.cover,
                              ),
                            )
                            : Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.insert_drive_file,
                                    color: AppColors.primary,
                                  ),
                                  SizedBox(width: 10.w),
                                  Flexible(
                                    child: CustomText(
                                      text: file.path.split('/').last,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                  );
                }),
              ),
              SizedBox(height: 32.h),
              CustomButton(
                onPressed: () {
                  Get.find<OwnerNavBarController>();
                  Get.toNamed(AppRoute.ownerNavBar);
                },
                text: "Create",
                isIcon: true,
                icon: Icons.arrow_forward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
