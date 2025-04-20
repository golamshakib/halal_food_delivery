import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

import '../../../../../core/utils/constants/image_path.dart';
import '../../controllers/customer_review_controller.dart';
import 'customer_review_box.dart';

class CustomerReviewList extends StatelessWidget {
  CustomerReviewList({super.key});
  final CustomerReviewController controller = Get.put(
    CustomerReviewController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12.h),
            ...controller.firstTenReview.asMap().entries.map((entry) {
              final item = entry.value;
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: CustomerReviewBox(
                  image: item['image'] ?? ImagePath.customer,
                  name: item['name'] ?? '',
                  message: item['message'] ?? '',
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
