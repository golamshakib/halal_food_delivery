import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';
import '../../controllers/owner_home_controller.dart';
import 'owner_custom_product_vertical.dart';

class OwnerMenuList extends StatelessWidget {
  OwnerMenuList({super.key});
  final OwnerHomeController controller = Get.put(OwnerHomeController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMenuData();
    });
    return Obx(
      () =>
          controller.isLoading.value
              ? _buildShimmerHorizontal(context)
              : controller.menuModel.value?.data == null ||
                  controller.menuModel.value!.data!.isEmpty
              ? Center(child: CustomText(text: 'No menu items available'))
              : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(height: 12.h),
                    ...controller.firstTenItems.asMap().entries.map((entry) {
                      final item = entry.value;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: OwnerCustomProductVertical(
                          image: item.image ?? ImagePath.background,
                          foodName: item.name ?? 'Unknown',
                          price: item.price?.toString() ?? '0.00',
                          star: item.averageRating?.toString() ?? '0.0',
                        ),
                      );
                    }),
                  ],
                ),
              ),
    );
  }

  Widget _buildShimmerHorizontal(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          3, // Show 3 shimmer placeholders
          (index) => Padding(
            padding: EdgeInsets.only(right: 16.w, bottom: 16.h),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 120.w, // Adjust based on OwnerCustomProductVertical size
                height: 150.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.h),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
