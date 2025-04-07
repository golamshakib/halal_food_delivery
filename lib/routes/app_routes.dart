import 'package:get/get.dart';

import '../features/authentication/presentation/screens/create_password_screen.dart';
import '../features/authentication/presentation/screens/forget_password_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/sing_up_screen.dart';
import '../features/authentication/presentation/screens/successful_screen.dart';
import '../features/authentication/presentation/screens/verification_successful_screen.dart';
import '../features/authentication/presentation/screens/verify_screen.dart';
import '../features/customer/customer_nav_bar/presentation/screens/customer_nav_bar.dart';
import '../features/delivery/delivery_nav_bar/presentation/screens/delivery_nav_bar.dart';
import '../features/language/presentation/screens/language_selection_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/owner/owner_nav_bar/presentation/screens/owner_nav_bar.dart';
import '../features/role_selection_screen/presentation/screens/role_selection_screen.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";
  static String forgetPasswordScreen = "/forgetPasswordScreen";
  static String verifyScreen = "/verifyScreen";
  static String createPasswordScreen = "/createPasswordScreen";
  static String successfulScreen = "/successfulScreen";
  static String verificationSuccessfulScreen = "/verificationSuccessfulScreen";
  static String init = "/";

  static String roleSelectionScreen = "/roleSelectionScreen";

  static String languageSelectionScreen = "/languageSelectionScreen";
  static String onboardingScreen = "/onboardingScreen";

  static String customerNavBar = "/customerNavBar";
  static String deliveryNavBar = "/deliveryNavBar";
  static String ownerNavBar = "/ownerNavBar";

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
    GetPage(name: createPasswordScreen, page: () => CreatePasswordScreen()),
    GetPage(name: successfulScreen, page: () => SuccessfulScreen()),

    GetPage(name: roleSelectionScreen, page: () => RoleSelectionScreen()),
    GetPage(
      name: verificationSuccessfulScreen,
      page: () => VerificationSuccessfulScreen(),
    ),

    GetPage(name: customerNavBar, page: () => CustomerNavBar()),
    GetPage(name: deliveryNavBar, page: () => DeliveryNavBar()),
    GetPage(name: ownerNavBar, page: () => OwnerNavBar()),
  ];
}
