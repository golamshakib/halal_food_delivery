import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      child: Obx(
        () => Row(
          children: [
            SizedBox(height: 12.h),
            // Use food from restaurantModel.data.result
            ...(controller.restaurantModel.value?.data?.result?.food ?? [])
                .asMap()
                .entries
                .take(10)
                .map((entry) {
                  final item = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(right: 16.h),
                    child: CustomerCustomProductVertical(
                      image: item.image ?? ImagePath.placeholder,
                      foodName: item.name ?? '',
                      price: item.price?.toString() ?? '0.00',
                      star:
                          item.review
                              ?.map((r) => r.rating ?? 0.0)
                              .reduce(
                                (a, b) =>
                                    a +
                                    b /
                                        (item.review!.isNotEmpty
                                            ? item.review!.length
                                            : 1),
                              )
                              .toStringAsFixed(1) ??
                          '0.0',
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
