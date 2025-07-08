import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      AppText.language: 'Language',
      AppText.continue1: 'Continue',
      AppText.english: 'English',
      AppText.arabic: 'Arabic',
      AppText.french: 'French',
    },
    'fr_FR': {
      AppText.language: "Langue",
      AppText.continue1: "Continuer",
      AppText.english: 'Anglais',
      AppText.arabic: 'Arabe',
      AppText.french: 'Français',
    },
    'ar_AR': {
      AppText.language: 'اللغة',
      AppText.continue1: 'متابعة',
      AppText.english: 'الإنجليزية',
      AppText.arabic: 'العربية',
      AppText.french: 'الفرنسية',
    },
  };
}
