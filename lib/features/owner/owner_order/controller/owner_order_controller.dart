import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerOrderController extends GetxController {
  final PageController pageController = PageController();
  final RxInt selectedTab = 0.obs;

  void changeTab(int tab) {
    selectedTab.value = tab;
    pageController.animateToPage(
      tab,
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeOut,
    );
  }
}
