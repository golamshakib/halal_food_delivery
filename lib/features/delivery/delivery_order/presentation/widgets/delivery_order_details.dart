import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../controller/delivery_details_controller.dart';
import 'delivery_order_product.dart';

class DeliveryOrderDetails extends StatelessWidget {
  DeliveryOrderDetails({super.key});
  final DeliveryDetailsController controller = Get.put(
    DeliveryDetailsController(),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 12.h),
          ...controller.foodItems.asMap().entries.map((entry) {
            final item = entry.value;
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: DeliveryOrderProduct(
                image: item['image'] ?? ImagePath.chicken,
                foodName: item['name'] ?? '',
                price: item['price'] ?? '0.00',
                star: item['rating'] ?? '0.0',
                location: item['location'] ?? '',
                isCompleted: false,
                isPreparing: false,
                isOnging: true,
                onOngoingTap: () {
                  Get.toNamed(AppRoute.deliveryOrderDetailsScreen);
                },
                onPreparingTap: () {},
              ),
            );
          }),
        ],
      ),
    );
  }
}
