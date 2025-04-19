import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../controllers/customer_my_list_controller.dart';
import 'customer_custom_product_vertical.dart';

class CustomerMyList extends StatelessWidget {
  CustomerMyList({super.key});
  final controller = Get.put(CustomerMyListController());

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.55,
      crossAxisCount: 3,
      crossAxisSpacing: 4.w,
      mainAxisSpacing: 20.h,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children:
          controller.foodItems.map((item) {
            return CustomerCustomProductVertical(
              image: item['image'] ?? ImagePath.chicken,
              foodName: item['name'] ?? '',
              price: item['price'] ?? '0.00',
              star: item['rating'] ?? '0.0',
            );
          }).toList(),
    );
  }
}
