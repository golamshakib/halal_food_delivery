import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class VerificationController extends GetxController {
  void navigateToRoleBasedScreen(String role) {
    if (role == "customer") {
      // Navigate to customer navbar
      Get.toNamed(AppRoute.customerNavBar);
    } else if (role == "owner") {
      // Navigate to owner navbar
      Get.toNamed(AppRoute.ownerNavBar);
    } else if (role == "delivery") {
      // Navigate to delivery navbar
      Get.toNamed(AppRoute.deliveryNavBar);
    }
  }
}
