import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../../customer_my_list/presentation/widgets/customer_custom_product_vertical.dart';
import '../../controllers/customer_search_controller.dart';

class CustomerSearch extends StatelessWidget {
  CustomerSearch({super.key});
  final controller = Get.put(CustomerSearchController());

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
