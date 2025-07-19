import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../controller/cusotmer_order_controller.dart';
import '../widgets/cusotmer_completed.dart';
import '../widgets/cusotmer_ongoing.dart';
import '../widgets/cusotmer_pending.dart';
import '../widgets/cusotmer_preparing.dart';

class CusotmerOrderScreen extends StatelessWidget {
  const CusotmerOrderScreen({
    super.key,
  }); // Use const constructor for better performance

  @override
  Widget build(BuildContext context) {
    // Use Get.put or Get.find carefully to avoid reusing the same controller
    final  controller = Get.put(
      CusotmerOrderController(),
      tag: UniqueKey().toString(),
    );

    return Scaffold(
      appBar: CustomApp(isBack: false, title: "My Order", istitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xffF2E8D1),
                    borderRadius: BorderRadius.circular(100.h),
                  ),
                  child: Row(
                    children: [
                      _buildTabItem(
                        index: 0,
                        title: "Pending",
                        controller: controller,
                      ),
                      SizedBox(width: 4.w),
                      _buildTabItem(
                        index: 1,
                        title: "Preparing",
                        controller: controller,
                      ),
                      SizedBox(width: 4.w),
                      _buildTabItem(
                        index: 2,
                        title: "Ongoing",
                        controller: controller,
                      ),
                      SizedBox(width: 4.w),
                      _buildTabItem(
                        index: 3,
                        title: "Completed",
                        controller: controller,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    controller.selectedTab.value = index;
                  },
                  children: [
                    CusotmerPending(),
                    CusotmerPreparing(),
                    CusotmerOngoing(),
                    CusotmerCompleted(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required int index,
    required String title,
    required CusotmerOrderController controller,
  }) {
    return InkWell(
      onTap: () => controller.changeTab(index),
      child: Obx(() {
        final isSelected = controller.selectedTab.value == index;
        return Container(
          width: 83.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.h),
            color: isSelected ? AppColors.primary : const Color(0xffF2E8D1),
          ),
          child: CustomText(
            textAlign: TextAlign.center,
            text: title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isSelected ? AppColors.textPrimary : AppColors.black,
          ),
        );
      }),
    );
  }
}
