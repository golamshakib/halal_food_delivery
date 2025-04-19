import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';

class CustomerMenuController extends GetxController {
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

  final List<Map<String, String>> foodItems =
      [
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
        {
          'image': ImagePath.chicken,
          'name': 'Veggie Chicken',
          'price': '479',
          'rating': '4.8',
          'location': ' 1234 Main Street, Springfield, NY...',
        },
      ].obs;

  List<Map<String, String>> get firstTenItems => foodItems.take(5).toList();
}
