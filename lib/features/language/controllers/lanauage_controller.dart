import 'package:get/get.dart';

// Controller for managing the selected language
class LanguageController extends GetxController {
  var selectedLanguage = 'en'.obs; 

  void changeLanguage(String languageCode) {
    selectedLanguage.value = languageCode;
  }
}

