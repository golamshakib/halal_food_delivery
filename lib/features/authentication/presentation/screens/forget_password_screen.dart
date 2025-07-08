import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';
import 'package:halal_food_delivery/features/authentication/controllers/forget_password_controller.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../widgets/custom_title_bar.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final controller = Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            CustomTitleBar(
              title: "Reset password",
              subtitle: "Please enter your email to reset the password",
            ),
            CustomTextField(
              controller: controller.emailController,
              prefixIcon: Icon(Icons.email_outlined),
              hintText: AppText.typeYourEmail.tr,
            ),
            Spacer(),
            Obx(
              () =>
                  controller.isLoading.value
                      ? SpinKitWave(color: AppColors.primary, size: 30.0)
                      : CustomButton(
                        // onPressed:
                        //     () => Get.to(
                        //       () => VerifyScreen(
                        //         role: Role.CUSTOMER,
                        //         screen: Screen.forgetPassword,
                        //         email: controller.emailController.text,
                        //       ),
                        //     ),
                          onPressed: () {
                          controller.forgetPassword();
                        },
                        text: AppText.continue1.tr,
                        isIcon: true,
                        icon: Icons.arrow_forward_outlined,
                      ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
