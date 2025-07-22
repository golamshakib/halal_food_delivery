import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../controllers/customer_restaurant_profile_controller.dart';
import '../screens/customer_restaurant_menu_screen.dart';
import 'customer_menu_list.dart';

class CustomerRestaurantDescription extends StatelessWidget {
  CustomerRestaurantDescription({super.key});
  final controller = Get.put(CustomerRestaurantProfileController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text:
                  controller.restaurantModel.value?.data?.result?.description ??
                  "",
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Our Menu", fontWeight: FontWeight.w600),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => CustomerRestaurantMenuScreen(
                        id:
                            controller
                                .restaurantModel
                                .value
                                ?.data
                                ?.result
                                ?.id ??
                            "",
                      ),
                    );
                  },
                  child: CustomText(
                    text: "See all",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            CustomerMenuList(),
          ],
        ),
      ),
    );
  }
}
