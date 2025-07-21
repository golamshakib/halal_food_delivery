import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../../../core/utils/constants/image_path.dart';
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
      child: Obx(
        () => Row(
          children: [
            SizedBox(height: 12.h),
            // Use nearestRestaurant from singleFoodModel
            ...(controller.nearbyRestaurantModel.value?.data ?? [])
                .asMap()
                .entries
                .map((entry) {
                  final item = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(right: 16.h),
                    child: CustomerRestaurantsBox(
                      image: item.image ?? ImagePath.placeholder,
                      name: item.name ?? '',
                      star: item.averageRating?.toStringAsFixed(1) ?? '0.0',
                      onTap: () {
                        Get.toNamed(AppRoute.customerRestaurantProfileScreen);
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
