import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../controller/cusotmer_details_controller.dart';
import 'cusotmer_order_product.dart';

class CusotmerOrderDetails extends StatelessWidget {
  CusotmerOrderDetails({super.key});
  final CusotmerDetailsController controller = Get.put(
    CusotmerDetailsController(),
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
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CusotmerOrderProduct(
                image: item['image'] ?? ImagePath.chicken,
                foodName: item['name'] ?? '',
                price: item['price'] ?? '0.00',
                star: item['rating'] ?? '0.0',
                isOnging: true,
                onOngoingTap: () {
                  Get.toNamed(AppRoute.ownerOrderDetailsScreen);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
