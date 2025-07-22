import 'package:get/get.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../core/services/Auth_service.dart';
import '../../../core/utils/constants/enums.dart';
import '../../customer/customer_nav_bar/presentation/screens/customer_nav_bar.dart';
import '../../delivery/delivery_nav_bar/presentation/screens/delivery_nav_bar.dart';
import '../../owner/owner_nav_bar/presentation/screens/owner_nav_bar.dart';

class SplashController extends GetxController {
  void navigateToHomeScreen() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (AuthService.token != null) {
        final Role? role = AuthService.roleAsEnum;
        if (role == Role.CUSTOMER) {
          Get.offAll(() => CustomerNavBar());
        } else if (role == Role.RESTAURANT_OWNER) {
          Get.offAll(() => OwnerNavBar());
        } else if (role == Role.DELIVERY_PARTNER) {
          Get.offAll(() => DeliveryNavBar());
        } else {
          Get.toNamed(AppRoute.languageSelectionScreen);
        }
      } else {
        Get.toNamed(AppRoute.languageSelectionScreen);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    navigateToHomeScreen();
  }
}
