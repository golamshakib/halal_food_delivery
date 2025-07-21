import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:shimmer/shimmer.dart';
import '../../../customer_food_profile/presentation/screens/customer_food_profile_screen.dart';
import '../../../customer_my_list/presentation/widgets/customer_custom_product_vertical.dart';
import '../../controllers/customer_search_controller.dart';

class CustomerSearch extends StatelessWidget {
  CustomerSearch({super.key});
  final controller = Get.put(CustomerSearchController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMenuData();
    });

    return Obx(() {
      if (controller.isLoading.value) {
        return GridView.count(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 20.h,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(4, (index) => _buildShimmer(context)),
        );
      } else if (controller.menuModel.value?.data == null ||
          controller.menuModel.value!.data!.isEmpty) {
        return Center(
          child: CustomText(
            text:
                'No items found for ${controller.searchController.text.trim()}',
          ),
        );
      } else {
        return GridView.count(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 20.h,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children:
              controller.menuModel.value!.data!.map((item) {
                return CustomerCustomProductVertical(
                  image: item.image ?? ImagePath.background,
                  foodName: item.name ?? '',
                  price: item.price?.toStringAsFixed(0) ?? '0.00',
                  star: item.averageRating?.toStringAsFixed(1) ?? '0.0',
                  offerPrice: item.offerPrice,
                  onTap: () {
                    Get.to(() => CustomerFoodProfileScreen(id: item.id!));
                  },
                );
              }).toList(),
        );
      }
    });
  }

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 160.w, // Adjusted width for 2-column layout
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.h),
          border: Border.all(color: const Color(0xff023621).withAlpha(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity, // Full width of the container
              height: 120.h, // Adjusted height for better proportion
              color: Colors.grey,
            ),
            SizedBox(height: 12.h),
            Container(width: 100.w, height: 16.h, color: Colors.grey),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 60.w, height: 12.h, color: Colors.grey),
                Container(width: 60.w, height: 12.h, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
