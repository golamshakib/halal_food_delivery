import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OwnerEditProfileController extends GetxController {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  final Rx<File?> pickedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }
}
