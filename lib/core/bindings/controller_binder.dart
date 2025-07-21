import 'package:get/get.dart';
import '../../features/language/controllers/lanauage_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<LanguageController>(LanguageController(), permanent: true);
  }
}
