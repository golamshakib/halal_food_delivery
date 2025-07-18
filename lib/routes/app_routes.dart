import 'package:get/get.dart';
import '../features/authentication/presentation/screens/forget_password_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/successful_screen.dart';
import '../features/authentication/presentation/screens/verification_successful_screen.dart';
import '../features/customer/customer_food_profile/presentation/screens/customer_food_profile_screen.dart';
import '../features/customer/customer_food_profile/presentation/screens/customer_order_confrim_screen.dart';
import '../features/customer/customer_food_profile/presentation/screens/customer_payment_screen.dart';
import '../features/customer/customer_food_profile/presentation/screens/customer_personal_information_screen.dart';
import '../features/customer/customer_nav_bar/presentation/screens/customer_nav_bar.dart';
import '../features/customer/customer_notification/presentation/screens/customer_notification_screen.dart';
import '../features/customer/customer_notification/presentation/screens/customer_rating_screen.dart';
import '../features/customer/customer_order/presentation/screens/cusotmer_order_details_screen.dart';
import '../features/customer/customer_profile/presentation/screens/customer_change_password_screen.dart';
import '../features/customer/customer_profile/presentation/screens/customer_policy_screen.dart';
import '../features/customer/customer_restaurant/presentation/screens/customer_restaurant_menu_screen.dart';
import '../features/customer/customer_restaurant/presentation/screens/customer_restaurant_profile_screen.dart';
import '../features/customer/home/presentation/screens/customer_search_result_screen.dart';
import '../features/customer/home/presentation/screens/customer_search_screen.dart';
import '../features/delivery/delivery_nav_bar/presentation/screens/delivery_nav_bar.dart';
import '../features/delivery/delivery_notification/presentation/screens/delivery_notification_screen.dart';
import '../features/delivery/delivery_order/presentation/screens/delivery_order_details_screen.dart';
import '../features/delivery/delivery_order/presentation/screens/delivery_order_scan_screen.dart';
import '../features/delivery/delivery_profile/presentation/screens/delivery_change_password_screen.dart';
import '../features/delivery/delivery_profile/presentation/screens/delivery_policy_screen.dart';
import '../features/delivery/home/presentation/screens/delivery_see_all_request_screen.dart';
import '../features/language/presentation/screens/language_selection_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/owner/home/presentation/screens/owner_my_order_screen.dart';
import '../features/owner/home/presentation/screens/owner_order_list_screen.dart';
import '../features/owner/owner_nav_bar/presentation/screens/owner_nav_bar.dart';
import '../features/owner/owner_notification/presentation/screens/owner_notification_screen.dart';
import '../features/owner/owner_order/presentation/screens/owner_order_details_screen.dart';
import '../features/owner/owner_order/presentation/screens/owner_order_scan_screen.dart';
import '../features/owner/owner_profile/presentation/screens/owner_add_menu_screen.dart';
import '../features/owner/owner_profile/presentation/screens/owner_change_password_screen.dart';
import '../features/owner/owner_profile/presentation/screens/owner_policy_screen.dart';
import '../features/role_selection_screen/presentation/screens/role_selection_screen.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String forgetPasswordScreen = "/forgetPasswordScreen";
  static String successfulScreen = "/successfulScreen";
  static String verificationSuccessfulScreen = "/verificationSuccessfulScreen";
  static String init = "/";

  static String roleSelectionScreen = "/roleSelectionScreen";

  static String languageSelectionScreen = "/languageSelectionScreen";
  static String onboardingScreen = "/onboardingScreen";

  static String customerNavBar = "/customerNavBar";
  static String deliveryNavBar = "/deliveryNavBar";
  static String ownerNavBar = "/ownerNavBar";

  static String ownerAddMenuScreen = "/ownerAddMenuScreen";
  static String ownerChangePasswordScreen = "/ownerChangePasswordScreen";
  static String ownerPolicyScreen = "/ownerPolicyScreen";

  static String customerChangePasswordScreen = "/customerChangePasswordScreen";
  
  static String customerPolicyScreen = "/customerPolicyScreen";

  static String deliveryChangePasswordScreen = "/deliveryChangePasswordScreen";

  static String deliveryPolicyScreen = "/deliveryPolicyScreen";

  static String deliverySeeAllRequestScreen = "/deliverySeeAllRequestScreen";
  static String deliveryNotificationScreen = "/deliveryNotificationScreen";
  static String deliveryOrderScanScreen = "/deliveryOrderScanScreen";
  static String deliveryOrderDetailsScreen = "/deliveryOrderDetailsScreen";

  static String ownerNotificationScreen = "/ownerNotificationScreen";
  static String ownerMyOrderScreen = "/ownerMyOrderScreen";
  static String ownerOrderListScreen = "/ownerOrderListScreen";
  static String ownerOrderDetailsScreen = "/ownerOrderDetailsScreen";
  static String ownerOrderScanScreen = "/ownerOrderScanScreen";

  static String cusotmerOrderDetailsScreen = "/cusotmerOrderDetailsScreen";
  static String customerNotificationScreen = "/customerNotificationScreen";
  static String customerRatingScreen = "/customerRatingScreen";
  static String customerSearchScreen = "/customerSearchScreen";
  static String customerSearchResultScreen = "/customerSearchResultScreen";
  static String customerRestaurantMenuScreen = "/customerRestaurantMenuScreen";
  static String customerRestaurantProfileScreen =
      "/customerRestaurantProfileScreen";

  static String customerFoodProfileScreen = "/customerFoodProfileScreen";
  static String customerPersonalInformationScreen =
      "/customerPersonalInformationScreen";
  static String customerPaymentScreen = "/customerPaymentScreen";
  static String customerOrderConfrimScreen = "/customerOrderConfrimScreen";

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: init, page: () => SplashScreen()),
    
    GetPage(
      name: languageSelectionScreen,
      page: () => LanguageSelectionScreen(),
    ),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: forgetPasswordScreen, page: () => ForgetPasswordScreen()),
    GetPage(name: successfulScreen, page: () => SuccessfulScreen()),

    GetPage(name: roleSelectionScreen, page: () => RoleSelectionScreen()),
    GetPage(
      name: verificationSuccessfulScreen,
      page: () => VerificationSuccessfulScreen(),
    ),

    GetPage(name: customerNavBar, page: () => CustomerNavBar()),
    GetPage(name: deliveryNavBar, page: () => DeliveryNavBar()),
    GetPage(name: ownerNavBar, page: () => OwnerNavBar()),
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

    GetPage(name: customerPolicyScreen, page: () => CustomerPolicyScreen()),

    GetPage(
      name: deliveryChangePasswordScreen,
      page: () => DeliveryChangePasswordScreen(),
    ),

    GetPage(name: deliveryPolicyScreen, page: () => DeliveryPolicyScreen()),
    GetPage(
      name: deliverySeeAllRequestScreen,
      page: () => DeliverySeeAllRequestScreen(),
    ),
    GetPage(
      name: deliveryNotificationScreen,
      page: () => DeliveryNotificationScreen(),
    ),
    GetPage(
      name: deliveryOrderScanScreen,
      page: () => DeliveryOrderScanScreen(),
    ),
    GetPage(
      name: deliveryOrderDetailsScreen,
      page: () => DeliveryOrderDetailsScreen(),
    ),
    GetPage(
      name: ownerNotificationScreen,
      page: () => OwnerNotificationScreen(),
    ),
    GetPage(name: ownerMyOrderScreen, page: () => OwnerMyOrderScreen()),
    GetPage(name: ownerOrderListScreen, page: () => OwnerOrderListScreen()),
    GetPage(
      name: ownerOrderDetailsScreen,
      page: () => OwnerOrderDetailsScreen(),
    ),
    GetPage(name: ownerOrderScanScreen, page: () => OwnerOrderScanScreen()),
    GetPage(
      name: cusotmerOrderDetailsScreen,
      page: () => CusotmerOrderDetailsScreen(),
    ),
    GetPage(
      name: customerNotificationScreen,
      page: () => CustomerNotificationScreen(),
    ),
    GetPage(name: customerRatingScreen, page: () => CustomerRatingScreen()),
    GetPage(name: customerSearchScreen, page: () => CustomerSearchScreen()),
    GetPage(
      name: customerSearchResultScreen,
      page: () => CustomerSearchResultScreen(),
    ),
    GetPage(
      name: customerRestaurantMenuScreen,
      page: () => CustomerRestaurantMenuScreen(),
    ),
    GetPage(
      name: customerRestaurantProfileScreen,
      page: () => CustomerRestaurantProfileScreen(),
    ),
    GetPage(
      name: customerFoodProfileScreen,
      page: () => CustomerFoodProfileScreen(),
    ),
    GetPage(
      name: customerPersonalInformationScreen,
      page: () => CustomerPersonalInformationScreen(),
    ),
    GetPage(name: customerPaymentScreen, page: () => CustomerPaymentScreen()),
    GetPage(
      name: customerOrderConfrimScreen,
      page: () => CustomerOrderConfrimScreen(),
    ),
  ];
}
