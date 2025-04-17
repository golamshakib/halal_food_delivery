import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/features/delivery/delivery_notification/presentation/widgets/delivery_notification_box.dart';

import '../../controllers/delivery_notification_controller.dart';

class DeliveryNotification extends StatelessWidget {
  final DeliveryNotificationController controller = Get.put(
    DeliveryNotificationController(),
  );

  DeliveryNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children:
            controller.notifications
                .map(
                  (notification) => DeliveryNotificationBox(
                    messgeTitle: notification.messgeTitle,
                    message: notification.message,
                    type: notification.type,
                    date: notification.date,
                    time: notification.time,
                  ),
                )
                .toList(),
      ),
    );
  }
}
