import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../controllers/customer_notification_controller.dart';
import 'customer_notification_box.dart';

class CustomerNotification extends StatelessWidget {
  final CustomerNotificationController controller = Get.put(
    CustomerNotificationController(),
  );

  CustomerNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children:
            controller.notifications
                .map(
                  (notification) => CustomerNotificationBox(
                    messgeTitle: notification.messgeTitle,
                    message: notification.message,
                    type: notification.type,
                    date: notification.date,
                    time: notification.time,
                    onTap: () {
                      Get.toNamed(AppRoute.customerRatingScreen);
                    },
                  ),
                )
                .toList(),
      ),
    );
  }
}
