import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../../controllers/owner_nav_bar_controller.dart';

class OwnerNavBar extends StatelessWidget {
  OwnerNavBar({super.key});

  final controller = Get.put(OwnerNavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnerNavBarController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(child: controller.screens[controller.currentIndex]),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            height: 80.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(
                  isText: true,
                  isColor: true,
                  unslectedIcon: IconPath.home,
                  slectedIcon: IconPath.blockhome,
                  label: 'Home',
                  index: 0,
                  controller: controller,
                ),
                buildNavItem(
                  isText: true,
                  isColor: true,
                  unslectedIcon: IconPath.list,
                  slectedIcon: IconPath.blocklist,
                  label: 'My Order',
                  index: 1,
                  controller: controller,
                ),
                buildNavItem(
                  isText: true,
                  isColor: true,
                  unslectedIcon: IconPath.profile,
                  slectedIcon: IconPath.blockprofile,
                  label: 'Profile',
                  index: 2,
                  controller: controller,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildNavItem({
    required bool isText,
    required bool isColor,
    required String unslectedIcon,
    required String slectedIcon,
    required String label,
    required int index,
    required OwnerNavBarController controller,
    double? height,
    double? width,
  }) {
    final isSelected = controller.currentIndex == index;
    final screenIndex = index > 3 ? index - 1 : index;

    return InkWell(
      onTap: () => controller.changeIndex(screenIndex),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isSelected ? slectedIcon : unslectedIcon,
            width: width ?? 24.w,
            height: height ?? 24.h,
          ),
          if (isText) ...[
            SizedBox(height: 8.h),
            CustomText(
              text: label,
              color: isSelected ? AppColors.primary : AppColors.black,
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ],
        ],
      ),
    );
  }
}
