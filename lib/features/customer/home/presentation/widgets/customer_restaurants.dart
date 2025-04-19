import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../controllers/customer_home_controller.dart';
import 'customer_restaurants_box.dart.dart';

class CustomerRestaurants extends StatelessWidget {
  CustomerRestaurants({super.key});
  final CustomerHomeController controller = Get.put(CustomerHomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            SizedBox(height: 12.h),
            ...controller.restaurantName.asMap().entries.map((entry) {
              final item = entry.value;
              return Padding(
                padding: EdgeInsets.only(right: 16.h),
                child: CustomerRestaurantsBox(
                  image: item['image'] ?? ImagePath.restaurants,
                  name: item['name'] ?? '',
                  star: item['rating'] ?? '0.0',
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
