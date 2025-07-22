import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import '../../../customer_restaurant/controllers/customer_restaurant_profile_controller.dart';
import '../../../customer_restaurant/presentation/screens/customer_restaurant_profile_screen.dart';
import 'customer_restaurants_box.dart.dart';

class CustomerOtherRestaurants extends StatelessWidget {
  final String id;
  const CustomerOtherRestaurants({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomerRestaurantProfileController>(tag: id);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            SizedBox(height: 12.h),
            ...(controller.restaurantModel.value?.data?.otherRestaurant ?? [])
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
                        log("Tapped with ID: ${item.id}");
                        if (item.id != null && item.id!.isNotEmpty) {
                          try {
                            Get.to(
                              () =>
                                  CustomerRestaurantProfileScreen(id: item.id!),
                            );
                            log("Navigating to restaurant with ID: ${item.id}");
                          } catch (e) {
                            log("Navigation error: $e");
                          }
                        } else {
                          log("Error: Restaurant ID is null or empty");
                        }
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
