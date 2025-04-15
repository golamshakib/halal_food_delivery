import 'package:get/get.dart';

import '../features/authentication/presentation/screens/create_password_screen.dart';
import '../features/authentication/presentation/screens/forget_password_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/sing_up_screen.dart';
import '../features/authentication/presentation/screens/successful_screen.dart';
import '../features/authentication/presentation/screens/verification_successful_screen.dart';
import '../features/authentication/presentation/screens/verify_screen.dart';
import '../features/customer/customer_nav_bar/presentation/screens/customer_nav_bar.dart';
import '../features/customer/customer_profile/presentation/screens/customer_change_password_screen.dart';
import '../features/customer/customer_profile/presentation/screens/customer_edit_profile_screen.dart';
import '../features/customer/customer_profile/presentation/screens/customer_policy_screen.dart';
import '../features/delivery/delivery_nav_bar/presentation/screens/delivery_nav_bar.dart';
import '../features/delivery/delivery_profile/presentation/screens/delivery_change_password_screen.dart';
import '../features/delivery/delivery_profile/presentation/screens/delivery_edit_profile_screen.dart';
import '../features/delivery/delivery_profile/presentation/screens/delivery_policy_screen.dart';
import '../features/language/presentation/screens/language_selection_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/owner/owner_nav_bar/presentation/screens/owner_nav_bar.dart';
import '../features/owner/owner_profile/presentation/screens/owner_add_menu_screen.dart';
import '../features/owner/owner_profile/presentation/screens/owner_change_password_screen.dart';
import '../features/owner/owner_profile/presentation/screens/owner_edit_profile_screen.dart';
import '../features/owner/owner_profile/presentation/screens/owner_policy_screen.dart';
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

  static String ownerEditProfileScreen = "/ownerEditProfileScreen";
  static String ownerAddMenuScreen = "/ownerAddMenuScreen";
  static String ownerChangePasswordScreen = "/ownerChangePasswordScreen";
  static String ownerPolicyScreen = "/ownerPolicyScreen";

  static String customerChangePasswordScreen = "/customerChangePasswordScreen";
  static String customerEditProfileScreen = "/customerEditProfileScreen";
  static String customerPolicyScreen = "/customerPolicyScreen";

  static String deliveryChangePasswordScreen = "/deliveryChangePasswordScreen";
  static String deliveryEditProfileScreen = "/deliveryEditProfileScreen";
  static String deliveryPolicyScreen = "/deliveryPolicyScreen";

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

    GetPage(name: ownerEditProfileScreen, page: () => OwnerEditProfileScreen()),
    GetPage(name: ownerAddMenuScreen, page: () => OwnerAddMenuScreen()),
    GetPage(
      name: ownerChangePasswordScreen,
      page: () => OwnerChangePasswordScreen(),
    ),
    GetPage(name: ownerPolicyScreen, page: () => OwnerPolicyScreen()),

    GetPage(
      name: customerChangePasswordScreen,
      page: () => CustomerChangePasswordScreen(),
    ),
    GetPage(
      name: customerEditProfileScreen,
      page: () => CustomerEditProfileScreen(),
    ),
    GetPage(name: customerPolicyScreen, page: () => CustomerPolicyScreen()),

    GetPage(
      name: deliveryChangePasswordScreen,
      page: () => DeliveryChangePasswordScreen(),
    ),
    GetPage(
      name: deliveryEditProfileScreen,
      page: () => DeliveryEditProfileScreen(),
    ),
    GetPage(name: deliveryPolicyScreen, page: () => DeliveryPolicyScreen()),
  ];
}
