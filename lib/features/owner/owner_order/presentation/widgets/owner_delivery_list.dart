import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../controller/owner_delivery_list_controller.dart';
import 'owner_delivery_box.dart';

class OwnerDeliveryList extends StatelessWidget {
  OwnerDeliveryList({super.key});
  final OwnerDeliveryListController controller = Get.put(
    OwnerDeliveryListController(),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      itemCount: controller.foodItems.length,
      itemBuilder: (context, index) {
        final item = controller.foodItems[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: OwnerDeliveryBox(
            image: item['image'] ?? ImagePath.delivery,
            foodName: item['name'] ?? '',
            star: item['rating'] ?? '0.0',
            location: item['location'] ?? '',
            onRequestTap: () {},
          ),
        );
      },
    );
  }
}
