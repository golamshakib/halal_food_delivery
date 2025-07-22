import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import '../../../customer_my_list/presentation/widgets/customer_custom_product_vertical.dart';
import '../../controllers/customer_restaurant_profile_controller.dart';

class CustomerMenuList extends StatelessWidget {
  CustomerMenuList({super.key});
  final controller = Get.put(CustomerRestaurantProfileController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        final foodList =
            controller.restaurantModel.value?.data?.result?.food ?? [];

        // Check if food list is empty
        if (foodList.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomText(text: "No menu items available"),
          );
        }

        // Display menu items if available
        return Row(
          children: [
            SizedBox(height: 12.h),
            ...foodList.asMap().entries.take(10).map((entry) {
              final item = entry.value;
              // Calculate average rating safely
              final averageRating =
                  item.review?.isNotEmpty == true
                      ? item.review!
                              .map((r) => r.rating ?? 0.0)
                              .reduce((a, b) => a + b) /
                          item.review!.length
                      : 0.0;
              return Padding(
                padding: EdgeInsets.only(right: 16.h),
                child: CustomerCustomProductVertical(
                  image: item.image ?? ImagePath.placeholder,
                  foodName: item.name ?? '',
                  price: item.price?.toString() ?? '0.00',
                  star: averageRating.toStringAsFixed(1),
                ),
              );
            }),
          ],
        );
      }),
    );
  }
}
