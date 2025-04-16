import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import '../../controllers/delivery_home_controller.dart';
import 'delivery_custom_product.dart';

class DeliveryFoodList extends StatelessWidget {
  final DeliveryHomeController controller = Get.put(DeliveryHomeController());

  DeliveryFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(height: 12.h),
          ...controller.firstTenItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: DeliveryCustomProduct(
                image: item['image'] ?? ImagePath.chicken,
                foodName: item['name'] ?? '',
                price: item['price'] ?? '0.00',
                star: item['rating'] ?? '0.0',
                location: item['location'] ?? '',
                onTap: () {
                  controller.removeItem(index);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
