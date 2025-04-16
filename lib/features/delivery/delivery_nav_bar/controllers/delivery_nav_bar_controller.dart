import 'package:get/get.dart';

import '../../delivery_order/presentation/screens/delivery_order_screen.dart';
import '../../delivery_profile/presentation/screens/delivery_profile_screen.dart';
import '../../home/presentation/screens/delivery_home_screen.dart';

class DeliveryNavBarController extends GetxController {
  int selectedIndex = 0;
  int get currentIndex => selectedIndex;

  List screens = [
    DeliveryHomeScreen(),
    DeliveryOrderScreen(),
    DeliveryProfileScreen(),
  ];
  void changeIndex(int index) {
    if (selectedIndex == index) {
      return;
    }
    selectedIndex = index;
    update();
  }
}
