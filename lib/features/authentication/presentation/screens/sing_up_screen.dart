import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/logo_path.dart';
import 'package:halal_food_delivery/features/authentication/controllers/sing_up_controller.dart';

import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.put(SingUpController());

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;

    log("Received arguments: $arguments (type: ${arguments.runtimeType})");
    final String? role = arguments is String ? arguments : null;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(LogoPath.blackLogo)),
            SizedBox(height: 50.h),
            CustomText(
              text: "Create an account",
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text:
                  "Start exploring a world of delicious meals, real-time tracking, and seamless deliveries!",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 24.h),
            CustomTextField(
              controller: controller.emailController,
              prefixIcon: Icon(Icons.email_outlined),
              hintText: "Type Your Email",
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: controller.locationController,
              prefixIcon: Icon(Icons.send_outlined),
              hintText: "Type Your Location",
            ),

            SizedBox(height: 16.h),
            Obx(
              () => CustomTextField(
                controller: controller.passwordController,
                hintText: 'Type Your Password',
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
            if (arguments == 'owner') ...[
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () async {
                  await controller.pickDocument();
                },
                child: Obx(() {
                  final file = controller.pickedFile.value;
                  final extension = file?.path.split('.').last.toLowerCase();
                  final isImage = ['jpg', 'jpeg', 'png'].contains(extension);

                  return Container(
                    width: double.infinity,
                    height: 180.h,
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
                                    text: "Commercial license/AVS Certificate",
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
                                height: 180.h,
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
            CustomButton(
              onPressed: () {
                Get.toNamed(AppRoute.verifyScreen, arguments: role);
              },
              text: "Sign Up",
            ),
            if (arguments == 'owner')
              SizedBox(height: 39.h)
            else
              SizedBox(height: 200.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Already have an account? ",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoute.loginScreen),
                  child: CustomText(
                    text: "Sign In",
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
    );
  }
}
