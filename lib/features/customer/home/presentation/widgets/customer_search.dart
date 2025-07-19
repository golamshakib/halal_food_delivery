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
          childAspectRatio: 0.55,
          crossAxisCount: 3,
          crossAxisSpacing: 4.w,
          mainAxisSpacing: 20.h,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(6, (index) => _buildShimmer(context)),
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
          childAspectRatio: 0.55,
          crossAxisCount: 3,
          crossAxisSpacing: 4.w,
          mainAxisSpacing: 20.h,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children:
              controller.menuModel.value!.data!.map((item) {
                return CustomerCustomProductVertical(
                  image: item.image ?? ImagePath.background,
                  foodName: item.name ?? '',
                  price: item.price?.toString() ?? '0.00',
                  star: item.averageRating?.toString() ?? '0.0',
                  offerPrice: item.offerPrice?.toDouble(),
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
        width: 125.w,
        margin: EdgeInsets.only(left: 0.w, right: 0.w, top: 52.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.h),
          border: Border.all(color: const Color(0xff023621).withAlpha(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 95.w, height: 100.h, color: Colors.grey),
            SizedBox(height: 63.h),
            Container(width: 100.w, height: 16.h, color: Colors.grey),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 40.w, height: 12.h, color: Colors.grey),
                Container(width: 40.w, height: 12.h, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
