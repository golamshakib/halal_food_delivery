import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/icon_path.dart';
import 'package:halal_food_delivery/core/utils/constants/logo_path.dart';
import 'package:halal_food_delivery/core/utils/validators/app_validator.dart';
import 'package:halal_food_delivery/features/authentication/controllers/sing_up_controller.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';

import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../routes/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  final Role role;
  SignUpScreen({super.key, required this.role});

  final controller = Get.put(SingUpController());

  @override
  Widget build(BuildContext context) {
    log("Role: ${role.toString()}");
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
        child: Form(
          key: controller.signUpFormKey,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(LogoPath.blackLogo)),
                SizedBox(height: 50.h),
                CustomText(
                  text: AppText.createAccount.tr,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: AppText.exploreDescription.tr,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  validator: AppValidator.validateEmail,
                  controller: controller.emailController,
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: AppText.typeYourEmail.tr,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  readOnly: true,
                  controller: controller.locationController,
                  prefixIcon: GestureDetector(
                    child: Icon(Icons.send_outlined),
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
                SizedBox(height: 16.h),
                Obx(
                  () => CustomTextField(
                    validator: AppValidator.validatePassword,
                    controller: controller.passwordController,
                    hintText: AppText.typeYourPassword.tr,
                    obscureText: !controller.isPasswordVisible.value,
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
                if (role == Role.RESTAURANT_OWNER) ...[
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () async {
                      await controller.pickDocument();
                    },
                    child: Obx(() {
                      final file = controller.pickedFile.value;
                      final extension =
                          file?.path.split('.').last.toLowerCase();
                      final isImage = [
                        'jpg',
                        'jpeg',
                        'png',
                      ].contains(extension);

                      return Container(
                        width: double.infinity,
                        height: 103.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFE0E0E0)),
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                        child:
                            file == null
                                ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: AppText.commercialLicense.tr,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff767676),
                                      ),
                                      SizedBox(height: 8.h),
                                      Icon(
                                        Icons.image_outlined,
                                        color: Color(0xff767676),
                                        size: 16.sp,
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
                                    height: 103.h,
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
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () async {
                      await controller.pickDocument1();
                    },
                    child: Obx(() {
                      final file = controller.pickedFile2.value;
                      final extension =
                          file?.path.split('.').last.toLowerCase();
                      final isImage = [
                        'jpg',
                        'jpeg',
                        'png',
                      ].contains(extension);

                      return Container(
                        width: double.infinity,
                        height: 103.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFE0E0E0)),
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                        child:
                            file == null
                                ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: AppText.signatureHere.tr,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff767676),
                                      ),
                                      SizedBox(height: 8.h),
                                      Image.asset(
                                        IconPath.signature,
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
                                    height: 103.h,
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
                ],
                SizedBox(height: 32.h),
                Obx(
                  () =>
                      controller.isLoading.value
                          ? SpinKitWave(color: AppColors.primary, size: 30.0)
                          : CustomButton(
                            onPressed: () {
                              if (controller.signUpFormKey.currentState!
                                  .validate()) {
                                controller.signUp(role);
                              }
                            },
                            text: AppText.signUp.tr,
                          ),
                ),
                if (role == Role.RESTAURANT_OWNER)
                  SizedBox(height: 39.h)
                else
                  SizedBox(height: 200.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppText.alreadyHaveAccount.tr,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () => Get.offAllNamed(AppRoute.loginScreen),
                      child: CustomText(
                        text: AppText.signIn.tr,
                        fontSize: 14.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
