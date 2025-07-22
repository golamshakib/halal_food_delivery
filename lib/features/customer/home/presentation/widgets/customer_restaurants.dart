import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/constants/image_path.dart';
import '../../../customer_food_profile/controllers/customer_food_profile_controller.dart';
import '../../../customer_restaurant/presentation/screens/customer_restaurant_profile_screen.dart';
import 'customer_restaurants_box.dart.dart';

class CustomerRestaurants extends StatelessWidget {
  CustomerRestaurants({super.key});
  final controller = Get.put(CustomerFoodProfileController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            SizedBox(height: 12.h),
            // Use nearestRestaurant from singleFoodModel
            ...(controller.singleFoodModel.value?.data?.nearestRestaurant ?? [])
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
                        Get.to(
                          () => CustomerRestaurantProfileScreen(id: item.id!),
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
}
