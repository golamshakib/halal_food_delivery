import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/logo_path.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/features/authentication/controllers/login_controller.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Center(child: Image.asset(LogoPath.blackLogo)),
              SizedBox(height: 40.h),
              CustomText(
                text: "Welcome Back 👋",
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text:
                    "We happy to see you again! To use your account, please sign in first.",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 24.h),
              CustomTextField(
                controller: controller.emailController,
                hintText: "Type Your Email",
                prefixIcon: Icon(Icons.email_outlined),
              ),
              SizedBox(height: 16.h),
              Obx(
                () => CustomTextField(
                  controller: controller.passwordController,
                  hintText: 'Enter your password',
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
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.forgetPasswordScreen),
                child: CustomText(
                  text: "Forgot password?",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),
              Obx(
                () =>
                    controller.isLoading.value
                        ? SpinKitWave(color: AppColors.primary, size: 30.0)
                        : CustomButton(
                          onPressed: () {
                            controller.login();
                          },
                          text: "Sign In",
                        ),
              ),
              SizedBox(height: 150.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "I don’t have an account? ",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoute.roleSelectionScreen),
                    child: CustomText(
                      text: "Sign up",
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
    );
  }
}
