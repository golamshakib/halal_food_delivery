import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import '../../controllers/on_boarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final controller = Get.put(OnboardingController());

  final pages = const [
    {
      "image": ImagePath.image1,
      "title": "Discover & Order Effortlessly",
      "description":
          "Explore a wide variety of restaurants and cuisines, all at your fingertips.",
    },
    {
      "image": ImagePath.image2,
      "title": "Track Your Order in Real Time",
      "description":
          "Know exactly where your food is with live tracking and instant updates.",
    },
    {
      "image": ImagePath.image3,
      "title": "Secure & Seamless Payments",
      "description":
          "Pay your way with multiple payment options, from credit cards to digital wallets.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (i) => controller.currentIndex.value = i,
                itemCount: pages.length,
                itemBuilder:
                    (context, i) => SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            pages[i]['image']!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 20.h),
                          CustomText(
                            text: pages[i]['title']!,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: CustomText(
                              text: pages[i]['description']!,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(pages.length, (j) {
                                final selected =
                                    controller.currentIndex.value == j;
                                return AnimatedContainer(
                                  duration: 300.milliseconds,
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  width: selected ? 24 : 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color:
                                        selected
                                            ? AppColors.primary
                                            : Colors.grey.withAlpha(127),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Obx(() {
                final isLast =
                    controller.currentIndex.value == pages.length - 1;
                return isLast
                    ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomButton(
                          onPressed: controller.onLoginPressed,
                          text: "Log In",
                          isIcon: true,
                          icon: Icons.arrow_forward_outlined,
                        ),
                        SizedBox(height: 12.h),
                        CustomButton(
                          onPressed: controller.onRegisterPressed,
                          text: "Register",
                          isIcon: true,
                          icon: Icons.arrow_forward_outlined,
                          iconColor: AppColors.textSecondary,
                          backgroundColor: Colors.white,
                          textColor: AppColors.textSecondary,
                          borderColor: AppColors.primary,
                        ),
                      ],
                    )
                    : CustomButton(
                      onPressed: controller.nextPage,
                      text: "Next",
                      isIcon: true,
                      icon: Icons.arrow_forward_outlined,
                    );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
