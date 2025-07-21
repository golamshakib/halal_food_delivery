import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:shimmer/shimmer.dart';
import '../../../customer_restaurant/presentation/screens/customer_restaurant_profile_screen.dart';
import '../../controllers/customer_home_controller.dart';
import 'customer_restaurants_box.dart.dart';

class CustomerNearbyRestaurants extends StatelessWidget {
  CustomerNearbyRestaurants({super.key});
  final controller = Get.put(CustomerHomeController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchnearbyRestaurant();
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        // Check if data is loading (null or empty)
        final isLoading =
            controller.nearbyRestaurantModel.value == null ||
            controller.nearbyRestaurantModel.value!.data == null ||
            controller.nearbyRestaurantModel.value!.data!.isEmpty;

        return Row(
          children: [
            SizedBox(width: 16.w), // Add some initial padding
            if (isLoading)
              // Display shimmer placeholders
              ...List.generate(
                3, // Number of shimmer placeholders
                (index) => Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: _buildShimmerBox(),
                ),
              )
            else
              // Display actual restaurant data
              ...(controller.nearbyRestaurantModel.value?.data ?? [])
                  .asMap()
                  .entries
                  .map((entry) {
                    final item = entry.value;
                    return Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: CustomerRestaurantsBox(
                        image: item.image ?? ImagePath.placeholder,
                        name: item.name ?? '',
                        star: item.averageRating?.toStringAsFixed(1) ?? '0.0',
                        onTap: () {
                          Get.to(
                            () => CustomerRestaurantProfileScreen(id: item.id!),
                          );
                        },
                      ),
                    );
                  }),
          ],
        );
      }),
    );
  }

  // Shimmer placeholder widget
  Widget _buildShimmerBox() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 157.w,
            height: 93.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 100.w, height: 14.h, color: Colors.white),
              SizedBox(width: 16.w),
              Icon(Icons.star, size: 15.sp, color: Colors.grey),
              SizedBox(width: 6.w),
              Container(width: 30.w, height: 13.h, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
