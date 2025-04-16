import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../controller/delivery_completed_controller.dart';
import 'delivery_order_product.dart';

class DeliveryCompleted extends StatelessWidget {
  DeliveryCompleted({super.key});
  final DeliveryCompletedController controller = Get.put(
    DeliveryCompletedController(),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      itemCount: controller.foodItems.length,
      itemBuilder: (context, index) {
        final item = controller.foodItems[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: DeliveryOrderProduct(
            image: item['image'] ?? ImagePath.chicken,
            foodName: item['name'] ?? '',
            price: item['price'] ?? '0.00',
            star: item['rating'] ?? '0.0',
            location: item['location'] ?? '',
            isCompleted: true,
            isPreparing: false,
            isOnging: false,
            onOngoingTap: () {},
            onPreparingTap: () {},
          ),
        );
      },
    );
  }
}
