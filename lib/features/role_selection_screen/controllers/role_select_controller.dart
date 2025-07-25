import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_snackbar.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';

import '../../../core/utils/constants/enums.dart';
import '../../authentication/presentation/screens/sing_up_screen.dart';

class RoleSelectionController extends GetxController {
  var selectedRole = Rx<Role?>(null);

  void selectRole(Role role) {
    selectedRole.value = role;
    // AuthService.saveRole(role);
  }

  bool isSelected(Role role) {
    return selectedRole.value == role;
  }

  void proceedToSignup() {
    if (selectedRole.value != null) {
      Role role = selectedRole.value!;
      Get.to(() => SignUpScreen(role: role));
    } else {
      AppSnackBar.showError(
        title: AppText.roleSelection.tr,
        AppText.selectRolePrompt.tr,
      );
    }
  }
}
