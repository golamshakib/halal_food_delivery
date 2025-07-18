import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:halal_food_delivery/features/owner/owner_profile/controllers/owner_edit_profile_controller.dart';

import '../../../../../core/utils/constants/app_texts.dart';
import '../../../../../core/utils/validators/app_validator.dart';

class OwnerEditProfileScreen extends StatelessWidget {
  final bool isOwner;
  OwnerEditProfileScreen({super.key, required this.isOwner});
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
                  validator: AppValidator.validateLocation,
                  readOnly: true,
                  controller: controller.locationController,
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.place),
                    onTap: () {
                      controller.toggleMapVisibility();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: SizedBox(
                              height: 400.h,
                              width: 300.w,
                              child: Obx(() {
                                final initialPosition =
                                    controller.userLocation.value ??
                                    controller.selectedLatLng.value ??
                                    const LatLng(0.0, 0.0);

                                return GoogleMap(
                                  myLocationEnabled: true,
                                  initialCameraPosition: CameraPosition(
                                    target: initialPosition,
                                    zoom: 14.0,
                                  ),
                                  onTap: (latLng) async {
                                    await controller.handleMapTap(latLng);
                                    Get.back();
                                  },
                                  markers:
                                      controller.selectedLatLng.value != null
                                          ? {
                                            Marker(
                                              markerId: const MarkerId(
                                                "selected",
                                              ),
                                              position:
                                                  controller
                                                      .selectedLatLng
                                                      .value!,
                                            ),
                                          }
                                          : {},
                                );
                              }),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  hintText: AppText.typeYourLocation.tr,
                ),
                if (isOwner == true) ...[
                  SizedBox(height: 16.h),
                  CustomText(text: "Description"),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    maxLine: 3,
                    controller: controller.descriptionController,
                    hintText: "write your description...",
                  ),
                ],
                SizedBox(height: 24.h),
                Obx(
                  () =>
                      controller.isLoading.value
                          ? SpinKitWave(color: AppColors.primary, size: 30.0)
                          : CustomButton(
                            onPressed: () {
                              controller.profileUpdate();
                            },
                            text: "Save",
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
