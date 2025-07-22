import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/icon_path.dart';
import 'package:halal_food_delivery/features/owner/owner_profile/controllers/owner_add_menu_controller.dart';
import '../../../../../core/utils/constants/enums.dart';
import '../../../home/model/menu_model.dart';

class OwnerAddMenuScreen extends StatelessWidget {
  final bool isAddMenu;
  OwnerAddMenuScreen({super.key, required this.isAddMenu});

  final controller = Get.put(OwnerAddMenuController());

  @override
  Widget build(BuildContext context) {
    // Pre-populate fields if editing
    if (!isAddMenu) {
      final Data menuItem = Get.arguments as Data;
      controller.loadMenuItemForEdit(menuItem);
    }

    return Scaffold(
      appBar: CustomApp(
        istitle: true,
        title: isAddMenu ? "Add Menu" : "Edit Menu",
      ),
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
                hintText: "Type your food name",
              ),
              SizedBox(height: 12.h),
              CustomText(text: "Category", fontSize: 14.sp),
              SizedBox(height: 8.h),
              Obx(
                () => CustomTextField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: controller.selectedCategory.value?.displayText,
                  ),
                  hintText: "Select a category",
                  suffixIcon: PopupMenuButton<Category>(
                    color: AppColors.white,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onSelected: controller.setCategory,
                    itemBuilder:
                        (_) =>
                            controller.categoryType
                                .map(
                                  (category) => PopupMenuItem(
                                    value: category,
                                    child: CustomText(
                                      text: category.displayText,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                                .toList(),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              CustomText(text: "Price", fontSize: 14.sp),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: controller.priceController,
                hintText: "Select your food price",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  CustomText(text: "Special Offer", fontSize: 14.sp),
                  const Spacer(),
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
                          hintText: "Select your offer price",
                          keyboardType: TextInputType.number,
                        )
                        : const SizedBox.shrink(),
              ),
              SizedBox(height: 12.h),
              CustomText(text: "Description", fontSize: 14.sp),
              SizedBox(height: 8.h),
              CustomTextField(
                maxLine: 3,
                controller: controller.descriptionController,
                hintText: "Type your food description",
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
                  final menuItem = isAddMenu ? null : Get.arguments as Data;

                  return Container(
                    width: double.infinity,
                    height: 108.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child:
                        file != null
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8.h),
                              child: Image.file(
                                file,
                                width: double.infinity,
                                height: 108.h,
                                fit: BoxFit.cover,
                              ),
                            )
                            : !isAddMenu && menuItem?.image != null
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8.h),
                              child: Image.network(
                                menuItem!.image!,
                                width: double.infinity,
                                height: 108.h,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Center(
                                          child: Icon(
                                            Icons.broken_image,
                                            color: Colors.grey,
                                          ),
                                        ),
                              ),
                            )
                            : Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: "Upload",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff767676),
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
                            ),
                  );
                }),
              ),
              SizedBox(height: 32.h),
              Obx(
                () =>
                    controller.isLoading.value
                        ? SpinKitWave(color: AppColors.primary, size: 30.0)
                        : CustomButton(
                          onPressed: () {
                            if (isAddMenu) {
                              controller.addMenu();
                            } else {
                              controller.updateMenu(Get.arguments.id!);
                            }
                          },
                          text: isAddMenu ? "Create" : "Update",
                          isIcon: true,
                          icon: Icons.arrow_forward,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
