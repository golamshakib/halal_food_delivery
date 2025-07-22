import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/enums.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../controllers/customer_menu_controller.dart';
import '../widgets/customer_menu.dart';

class CustomerRestaurantMenuScreen extends StatelessWidget {
  final String id;
  CustomerRestaurantMenuScreen({super.key, required this.id});
  final controller = Get.put(CustomerMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Our Menu"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTabItem(index: 0, title: "Appetizers"),
                  SizedBox(width: 4.w),
                  _buildTabItem(index: 1, title: "Desserts"),
                  SizedBox(width: 4.w),
                  _buildTabItem(index: 2, title: "Burger"),
                  SizedBox(width: 4.w),
                  _buildTabItem(index: 3, title: "Drink"),
                  SizedBox(width: 4.w),
                  _buildTabItem(index: 4, title: "Salad"),
                  SizedBox(width: 4.w),
                  _buildTabItem(index: 5, title: "Fries"),
                  SizedBox(width: 4.w),
                  _buildTabItem(index: 6, title: "Other"),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Flexible(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: [
                  CustomerMenu(id: id, category: Category.APPETIZERS),
                  CustomerMenu(id: id, category: Category.DESSERTS),
                  CustomerMenu(id: id, category: Category.BURGER),
                  CustomerMenu(id: id, category: Category.DRINK),
                  CustomerMenu(id: id, category: Category.SALAD),
                  CustomerMenu(id: id, category: Category.FRIES),
                  CustomerMenu(id: id, category: Category.OTHER),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({required int index, required String title}) {
    return InkWell(
      onTap: () => controller.changeTab(index),
      child: Obx(() {
        final isSelected = controller.selectedTab.value == index;
        return Container(
          width: 91.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.primary : Color(0xff808080),
            ),
            borderRadius: BorderRadius.circular(50.h),
            color: isSelected ? AppColors.primary : null,
          ),
          child: CustomText(
            textAlign: TextAlign.center,
            text: title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.textPrimary : AppColors.black,
          ),
        );
      }),
    );
  }
}
