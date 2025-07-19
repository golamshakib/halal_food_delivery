import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CusotmerOrderController extends GetxController {
  late final PageController pageController; // Use late initialization
  final RxInt selectedTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(); // Initialize PageController here
  }

  void changeTab(int tab) {
    selectedTab.value = tab;
    pageController.animateToPage(
      tab,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose(); // Dispose of PageController
    super.onClose();
  }
}
