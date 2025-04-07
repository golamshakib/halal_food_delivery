import 'package:get/get.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../core/common/widgets/custom_snack_bar.dart';

class RoleSelectionController extends GetxController {
  var selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
    // AuthService.saveRole(role);
  }

  bool isSelected(String role) {
    return selectedRole.value == role;
  }

  void proceedToSignup() {
    if (selectedRole.value.isNotEmpty) {
      String role = selectedRole.value.toLowerCase();
      Get.toNamed(AppRoute.signUpScreen, arguments: role);
    } else {
      CustomSnackBar.showCustomErrorSnackBar(
        title: "Role Selection",
        message: "Please select a role before proceeding.",
      );
    }
  }
}
