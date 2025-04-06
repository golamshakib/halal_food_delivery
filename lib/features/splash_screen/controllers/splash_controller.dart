import 'package:get/get.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

class SplashController extends GetxController {
  void navigateToHomeScreen() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.toNamed(AppRoute.languageSelectionScreen);
    });
  }

  @override
  void onInit() {
    super.onInit();
    navigateToHomeScreen();
  }
}
