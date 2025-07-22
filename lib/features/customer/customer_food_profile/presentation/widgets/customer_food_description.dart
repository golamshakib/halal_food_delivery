import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../controllers/customer_food_profile_controller.dart';

class CustomerFoodDescription extends StatelessWidget {
  CustomerFoodDescription({super.key});
  final controller = Get.put(CustomerFoodProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: controller.singleFoodModel.value?.data?.description ?? "",
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
