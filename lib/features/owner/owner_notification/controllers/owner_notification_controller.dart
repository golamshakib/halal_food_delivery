import 'package:get/get.dart';

import '../data/model/owner_notification_model.dart';

class OwnerNotificationController extends GetxController {
  final notifications = <OwnerNotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    notifications.addAll([
      OwnerNotificationModel(
        messgeTitle: "Your Order is on the Way!",
        message:
            "Please review the completed work. If you have any concerns, feel free to contact us.",
        type: "security",
        date: "05 Jan 2023",
        time: "10:00 AM",
      ),
      OwnerNotificationModel(
        messgeTitle: "Your OTP Code",
        message:
            "Your one-time password (OTP) is 596423. Use this code to verify your action. Do not share it with anyone.",
        type: "verify",
        date: "05 Jan 2023",
        time: "10:00 AM",
      ),
      OwnerNotificationModel(
        messgeTitle: "Rate Your Delivery Experience!",
        message:
            "How was your delivery? Let us know by reviewing your delivery person. Your feedback helps us improve!",
        type: "rate",
        date: "05 Jan 2023",
        time: "10:00 AM",
      ),
    ]);
  }
}
