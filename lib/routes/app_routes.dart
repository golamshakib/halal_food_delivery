import 'package:get/get.dart';

import '../features/authentication/presentation/screens/forget_password_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/sing_up_screen.dart';
import '../features/authentication/presentation/screens/verify_screen.dart';
import '../features/language/presentation/screens/language_selection_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";
  static String forgetPasswordScreen = "/forgetPasswordScreen";
  static String verifyScreen = "/verifyScreen";
  static String init = "/";

  static String languageSelectionScreen = "/languageSelectionScreen";
  static String onboardingScreen = "/onboardingScreen";

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: init, page: () => SplashScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),

    GetPage(
      name: languageSelectionScreen,
      page: () => LanguageSelectionScreen(),
    ),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: forgetPasswordScreen, page: () => ForgetPasswordScreen()),
    GetPage(name: verifyScreen, page: () => VerifyScreen()),
  ];
}
