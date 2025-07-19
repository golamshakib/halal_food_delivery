import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomerFoodProfileController extends GetxController {
  LatLng get initialPosition => const LatLng(40.7128, -74.0060);
  late final PageController pageController; // Use late initialization
  final RxInt selectedTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
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
    pageController.dispose();
    super.onClose();
  }
}
