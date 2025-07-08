import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../controllers/on_boarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final controller = Get.put(OnboardingController());

  final pages = [
    {
      "image": ImagePath.image1,
      "title": AppText.discoverOrder,
      "description": AppText.discoverOrderDesc,
    },
    {
      "image": ImagePath.image2,
      "title": AppText.trackOrder,
      "description": AppText.trackOrderDesc,
    },
    {
      "image": ImagePath.image3,
      "title": AppText.securePayments,
      "description": AppText.securePaymentsDesc,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
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
                            Align(
                              alignment: Alignment.center,
                              child: CustomText(
                                textAlign: TextAlign.center,
                                text: pages[i]['title']!.tr,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: CustomText(
                                text: pages[i]['description']!.tr,
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
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                    ),
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
                            text: AppText.logIn.tr,
                            isIcon: true,
                            icon: Icons.arrow_forward_outlined,
                          ),
                          SizedBox(height: 12.h),
                          CustomButton(
                            onPressed: controller.onRegisterPressed,
                            text: AppText.register.tr,
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
                        text: AppText.next.tr,
                        isIcon: true,
                        icon: Icons.arrow_forward_outlined,
                      );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
