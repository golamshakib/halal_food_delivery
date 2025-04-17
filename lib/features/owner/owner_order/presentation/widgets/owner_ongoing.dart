import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../controller/owner_onging_controller.dart';
import 'owner_order_product.dart';

class OwnerOngoing extends StatelessWidget {
  OwnerOngoing({super.key});
  final OwnerOngingController controller = Get.put(OwnerOngingController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      itemCount: controller.foodItems.length,
      itemBuilder: (context, index) {
        final item = controller.foodItems[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: OwnerOrderProduct(
            image: item['image'] ?? ImagePath.chicken,
            foodName: item['name'] ?? '',
            price: item['price'] ?? '0.00',
            star: item['rating'] ?? '0.0',
            location: item['location'] ?? '',
            isCompleted: false,
            isPreparing: false,
            isOnging: true,
            onOngoingTap: () {
              Get.toNamed(AppRoute.ownerOrderScanScreen);
            },
            onPreparingTap: () {},
          ),
        );
      },
    );
  }
}
