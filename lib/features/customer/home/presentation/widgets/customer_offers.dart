import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../customer_food_profile/presentation/screens/customer_food_profile_screen.dart';
import '../../../customer_my_list/presentation/widgets/customer_custom_product_vertical.dart';
import '../../controllers/customer_home_controller.dart';

class CustomerOffers extends StatelessWidget {
  final CustomerHomeController controller = Get.put(CustomerHomeController());
  CustomerOffers({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMenuData();
    });
    return Obx(
      () =>
          controller.isLoading.value
              ? _buildShimmerHorizontal(context)
              : controller.offerModel.value?.data == null ||
                  controller.offerModel.value!.data!.isEmpty
              ? const Center(
                child: CustomText(text: 'No Offer items available'),
              )
              : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(height: 12.h),
                    ...controller.offerModel.value!.data!.asMap().entries.map((
                      entry,
                    ) {
                      final item = entry.value;
                      return Padding(
                        padding: EdgeInsets.only(right: 16.h),
                        child: CustomerCustomProductVertical(
                          offerPrice: item.offerPrice ?? 0,
                          image: item.image ?? ImagePath.background,
                          foodName: item.name ?? '',
                          price: (item.price ?? 0).toString(),
                          star: (item.averageRating ?? 0).toString(),
                          onTap: () {
                            Get.to(
                              () => CustomerFoodProfileScreen(id: item.id!),
                            );
                          },
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
                width:
                    120.w, // Adjust based on CustomerCustomProductVertical size
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
