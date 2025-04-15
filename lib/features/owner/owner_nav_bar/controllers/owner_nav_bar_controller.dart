import 'package:get/get.dart';

import '../../home/presentation/screens/owner_home_screen.dart';
import '../../owner_profile/presentation/screens/owner_profile_screen.dart';

class OwnerNavBarController extends GetxController {
  int selectedIndex = 0;
  int get currentIndex => selectedIndex;

  List screens = [OwnerHomeScreen(), OwnerHomeScreen(), OwnerProfileScreen()];
  void changeIndex(int index) {
    if (selectedIndex == index) {
      return;
    }
    selectedIndex = index;
    update();
  }
}
