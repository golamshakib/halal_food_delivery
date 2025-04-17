import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/owner_notification_controller.dart';
import 'owner_notification_box.dart';

class OwnerNotification extends StatelessWidget {
  final OwnerNotificationController controller = Get.put(
    OwnerNotificationController(),
  );

  OwnerNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children:
            controller.notifications
                .map(
                  (notification) => OwnerNotificationBox(
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
