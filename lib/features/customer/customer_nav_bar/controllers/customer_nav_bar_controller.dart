import 'package:get/get.dart';

import '../../customer_my_list/presentation/screens/customer_my_list_screen.dart';
import '../../customer_order/presentation/screens/cusotmer_order_screen.dart';
import '../../customer_profile/presentation/screens/customer_profile_screen.dart';
import '../../home/presentation/screens/customer_home_screen.dart';

class CustomerNavBarController extends GetxController {
  int selectedIndex = 0;
  int get currentIndex => selectedIndex;

  List screens = [
    CustomerHomeScreen(),
    CusotmerOrderScreen(),
    CustomerMyListScreen(),
    CustomerProfileScreen(),
  ];
  void changeIndex(int index) {
    if (selectedIndex == index) {
      return;
    }
    selectedIndex = index;
    update();
  }
}
