import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/utils/constants/image_path.dart';

class CustomerHomeController extends GetxController {
  final searchController = TextEditingController();
  LatLng get initialPosition => const LatLng(40.7128, -74.0060);

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

  final List<Map<String, String>> restaurantName =
      [
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
        {
          'image': ImagePath.restaurants,
          'name': 'Savory Haven',
          'rating': '4.8',
        },
      ].obs;
}
