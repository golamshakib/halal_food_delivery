import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/constants/image_path.dart';
import '../../controllers/customer_food_profile_controller.dart';
import 'customer_review_box.dart';

class CustomerReviewList extends StatelessWidget {
  CustomerReviewList({super.key});
  final controller = Get.find<CustomerFoodProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final reviews = controller.singleFoodModel.value?.data?.review ?? [];
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12.h),
              ...reviews.take(10).map((item) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: CustomerReviewBox(
                    image: item.userDetails?.image ?? ImagePath.customer,
                    name: item.userDetails?.name ?? 'Anonymous',
                    message: item.comment ?? '',
                    star: item.rating?.toString() ?? '0.0',
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}