import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';

import '../../../customer_my_list/presentation/widgets/customer_custom_product_vertical.dart';
import '../../controllers/customer_home_controller.dart';

class CustomerOffers extends StatelessWidget {
  final CustomerHomeController controller = Get.put(CustomerHomeController());

  CustomerOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            SizedBox(height: 12.h),
            ...controller.foodItems.asMap().entries.map((entry) {
              final item = entry.value;
              return Padding(
                padding: EdgeInsets.only(right: 16.h),
                child: CustomerCustomProductVertical(
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
