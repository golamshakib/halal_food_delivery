import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';

import '../../controllers/owner_home_controller.dart';
import 'owner_custom_product_vertical.dart';

class OwnerMenuList extends StatelessWidget {
  final OwnerHomeController controller = Get.put(OwnerHomeController());

  OwnerMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(height: 12.h),
            ...controller.firstTenItems.asMap().entries.map((entry) {
              final item = entry.value;
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: OwnerCustomProductVertical(
                  image: item['image'] ?? ImagePath.chicken,
                  foodName: item['name'] ?? '',
                  price: item['price'] ?? '0.00',
                  star: item['rating'] ?? '0.0',
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
