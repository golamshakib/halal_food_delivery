import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/common/widgets/custom_home_app_bar.dart';
import '../../../../../routes/app_routes.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(
        userName: "John Doe",
        userImageUrl: 'https://i.pravatar.cc/150?img=1',
        onNotification: () {
          Get.toNamed(AppRoute.deliveryNotificationScreen);
        },
      ),
    );
  }
}
