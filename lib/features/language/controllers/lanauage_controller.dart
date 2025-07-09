import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'en'.obs;
  var currentLocale = Locale('en', 'US').obs;

  void changeLanguage(String languageCode) {
    selectedLanguage.value = languageCode;
    switch (languageCode) {
      case 'en':
        setEnglish();
        break;
      case 'fr':
        setFrench();
        break;
      case 'ar':
        setArabic();
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  void setEnglish() {
    currentLocale.value = Locale('en', 'US');
    Get.updateLocale(currentLocale.value);
    _saveLanguage('en_US');
  }

  void setFrench() {
    currentLocale.value = Locale('fr', 'FR');
    Get.updateLocale(currentLocale.value);
    _saveLanguage('fr_FR');
  }

  void setArabic() {
    currentLocale.value = Locale('ar', 'AR');
    Get.updateLocale(currentLocale.value);
    _saveLanguage('ar_AR');
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language');
    if (savedLanguage != null) {
      currentLocale.value = Locale(
        savedLanguage.split('_')[0],
        savedLanguage.split('_')[1],
      );
      selectedLanguage.value = savedLanguage.split('_')[0];
      Get.updateLocale(currentLocale.value);
    } else {
      currentLocale.value = Get.deviceLocale ?? Locale('en', 'US');
      Get.updateLocale(currentLocale.value);
    }
  }

  Future<void> _saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
  }
}
