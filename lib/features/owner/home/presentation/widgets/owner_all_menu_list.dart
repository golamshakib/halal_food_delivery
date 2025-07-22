import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:shimmer/shimmer.dart';
import '../../../owner_profile/presentation/screens/owner_add_menu_screen.dart';
import '../../controllers/owner_home_controller.dart';
import 'owner_menu_product.dart';

class OwnerAllMenuList extends StatelessWidget {
  OwnerAllMenuList({super.key});

  final controller = Get.put(OwnerHomeController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMenuData();
    });
    return Obx(
      () =>
          controller.isLoading.value
              ? _buildShimmerVertical(context)
              : controller.menuModel.value?.data == null ||
                  controller.menuModel.value!.data!.isEmpty
              ? const Center(child: CustomText(text: 'No menu items available'))
              : Column(
                children: [
                  SizedBox(height: 12.h),
                  ...controller.menuModel.value!.data!.asMap().entries.map((
                    entry,
                  ) {
                    final item = entry.value;
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: OwnerMenuProduct(
                        offerPrice: item.offerPrice ?? 0,
                        image: item.image ?? ImagePath.background,
                        foodName: item.name ?? 'Unknown',
                        price: item.price?.toString() ?? '0.00',
                        star: item.averageRating?.toString() ?? '0.0',
                        onDeleteTap: () {
                          controller.removeItem(item.id!);
                          log("${item.id}");
                        },
                        onCheckTap: () {
                          Get.to(
                            () => OwnerAddMenuScreen(isAddMenu: false),
                            arguments: item,
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
    );
  }

  Widget _buildShimmerVertical(BuildContext context) {
    return Column(
      children: List.generate(
        3, // Show 3 shimmer placeholders
        (index) => Padding(
          padding: EdgeInsets.only(bottom: 16.h, left: 20.w, right: 20.w),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 100.h, // Adjust based on OwnerMenuProduct size
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7.h),
                border: Border.all(color: Colors.grey.withAlpha(25)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 71.414.w,
                    height: 75.102.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100.w,
                          height: 14.h,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          width: 50.w,
                          height: 12.h,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
