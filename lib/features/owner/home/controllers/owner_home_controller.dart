import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';

class OwnerHomeController extends GetxController {
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

  void removeItem(int index) {
    foodItems.removeAt(index);
  }

  void addItem(int index) {
    foodItems.removeAt(index);
  }

  List<Map<String, String>> get firstTenItems => foodItems.take(5).toList();
}
