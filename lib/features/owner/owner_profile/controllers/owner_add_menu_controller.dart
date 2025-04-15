import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OwnerAddMenuController extends GetxController {
  final foodNameController = TextEditingController();
  final priceController = TextEditingController();
  final offerController = TextEditingController();
  final descriptionController = TextEditingController();

  final Rx<File?> pickedImage = Rx<File?>(null);
  final isOfferEnabled = false.obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }
}
