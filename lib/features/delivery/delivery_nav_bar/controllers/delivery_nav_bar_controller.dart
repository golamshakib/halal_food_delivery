import 'package:get/get.dart';

import '../../home/presentation/screens/delivery_home_screen.dart';

class DeliveryNavBarController extends GetxController {
  int selectedIndex = 0;
  int get currentIndex => selectedIndex;

  List screens = [
    DeliveryHomeScreen(),
    DeliveryHomeScreen(),
    DeliveryHomeScreen(),
  ];
  void changeIndex(int index) {
    if (selectedIndex == index) {
      return;
    }
    selectedIndex = index;
    update();
  }
}
