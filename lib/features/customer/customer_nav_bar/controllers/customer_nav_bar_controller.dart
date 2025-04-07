import 'package:get/get.dart';

import '../../home/presentation/screens/customer_home_screen.dart';

class CustomerNavBarController extends GetxController {
  int selectedIndex = 0;
  int get currentIndex => selectedIndex;

  List screens = [
    CustomerHomeScreen(),
    CustomerHomeScreen(),
    CustomerHomeScreen(),
    CustomerHomeScreen(),
  ];
  void changeIndex(int index) {
    if (selectedIndex == index) {
      return;
    }
    selectedIndex = index;
    update();
  }
}
