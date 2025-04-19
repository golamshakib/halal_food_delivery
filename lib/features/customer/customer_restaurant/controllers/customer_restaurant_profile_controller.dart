import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomerRestaurantProfileController extends GetxController {
  LatLng get initialPosition => const LatLng(40.7128, -74.0060);
  final PageController pageController = PageController();
  final RxInt selectedTab = 0.obs;
  void changeTab(int tab) {
    selectedTab.value = tab;
    pageController.animateToPage(
      tab,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeOut,
    );
  }
}
