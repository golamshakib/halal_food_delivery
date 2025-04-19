import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../controllers/customer_bannar_controller.dart';

class CustomerHomeBannar extends StatelessWidget {
  CustomerHomeBannar({super.key});
  final controller = Get.put(CustomerBannarController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => PageView.builder(
                controller: PageController(
                  initialPage: controller.currentIndex.value,
                ),
                onPageChanged: (index) {
                  controller.currentIndex.value = index;
                },
                itemCount: controller.bannerImages.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      width: 400.w,
                      height: 150.h,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(controller.bannerImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.bannerImages.length,
                (index) => Container(
                  width: 10.w,
                  height: 10.h,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        controller.currentIndex.value == index
                            ? AppColors.primary
                            : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
