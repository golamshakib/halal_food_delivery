import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerRatingController extends GetxController {
  final reviewController = TextEditingController();
  final selectedRating = RxString('');

  void selectRating(String rating) {
    selectedRating.value = rating;
  }
}
