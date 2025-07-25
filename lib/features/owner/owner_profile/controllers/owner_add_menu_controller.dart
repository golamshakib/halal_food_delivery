import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

import '../../../../core/services/Auth_service.dart';
import '../../../../core/utils/constants/app_snackbar.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/logging/logger.dart';
import '../../home/controllers/owner_home_controller.dart';
import '../../home/model/menu_model.dart';

class OwnerAddMenuController extends GetxController {
  final controller = Get.put(OwnerHomeController());
  final foodNameController = TextEditingController();
  final priceController = TextEditingController();
  final offerController = TextEditingController();
  final descriptionController = TextEditingController();
  var isLoading = false.obs;
  final Rx<File?> pickedImage = Rx<File?>(null);
  final isOfferEnabled = false.obs;
  final Rx<Category?> selectedCategory = Rx<Category?>(null);
  var menuItemId = ''.obs; // Store the ID of the menu item being edited

  // List of available categories
  final categoryType = Category.values;

  // Method to set the selected category
  void setCategory(Category? category) {
    selectedCategory.value = category;
  }

  // Load existing menu item data for editing
  void loadMenuItemForEdit(Data menuItem) {
    menuItemId.value = menuItem.id ?? '';
    foodNameController.text = menuItem.name ?? '';
    priceController.text = menuItem.price?.toString() ?? '';
    offerController.text = menuItem.offerPrice?.toString() ?? '';
    descriptionController.text = menuItem.description ?? '';
    selectedCategory.value = Category.values.firstWhereOrNull(
      (category) => category.name == menuItem.category,
    );
    isOfferEnabled.value =
        menuItem.offerPrice != null && menuItem.offerPrice! > 0;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }

  Future<void> addMenu() async {
    final foodName = foodNameController.text.trim();
    final price = priceController.text.trim();
    final offer = offerController.text.trim();
    final description = descriptionController.text.trim();

    // Validation
    if (foodName.isEmpty) {
      AppSnackBar.showError("Food name is required");
      return;
    }

    if (selectedCategory.value == null) {
      AppSnackBar.showError("Please select a category");
      return;
    }

    if (price.isEmpty) {
      AppSnackBar.showError("Price is required");
      return;
    }

    if (description.isEmpty) {
      AppSnackBar.showError("Description is required");
      return;
    }

    if (pickedImage.value == null) {
      AppSnackBar.showError("Please select an image");
      return;
    }

    if (isOfferEnabled.value && offer.isEmpty) {
      AppSnackBar.showError(
        "Offer price is required when special offer is enabled",
      );
      return;
    }

    isLoading.value = true;

    final requestBody = {
      "name": foodName,
      "description": description,
      "price": int.tryParse(price),
      "offerPrice": int.tryParse(offer) ?? 0,
      "category": selectedCategory.value!.name,
    };
    log("$requestBody");

    try {
      final uri = Uri.parse(AppUrls.addMenu);
      final request =
          http.MultipartRequest('POST', uri)
            ..headers['Authorization'] = "Bearer ${AuthService.token}"
            ..fields['bodyData'] = jsonEncode(requestBody);

      if (pickedImage.value != null) {
        final file = pickedImage.value!;
        if (await file.exists()) {
          final extension = file.path.split('.').last.toLowerCase();
          if (['jpg', 'jpeg', 'png'].contains(extension)) {
            request.files.add(
              await http.MultipartFile.fromPath(
                'foodImage',
                file.path,
                contentType: MediaType('image', extension),
              ),
            );
          } else {
            AppSnackBar.showError("Unsupported image format: $extension");
            isLoading.value = false;
            return;
          }
        } else {
          AppSnackBar.showError("Selected image file does not exist");
          isLoading.value = false;
          return;
        }
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        Get.back();
        AppSnackBar.showSuccess("Menu Added Successfully");
        controller.fetchMenuData();
        // Clear text fields and reset form state
        foodNameController.clear();
        priceController.clear();
        offerController.clear();
        descriptionController.clear();
        pickedImage.value = null;
        selectedCategory.value = null;
        isOfferEnabled.value = false;
      } else {
        AppSnackBar.showError("Failed to add menu");
        log('Failed to add menu: ${response.body}');
      }
    } catch (e) {
      AppSnackBar.showError("Error adding menu: $e");
      AppLoggerHelper.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateMenu(String id) async {
    final foodName = foodNameController.text.trim();
    final price = priceController.text.trim();
    final offer = offerController.text.trim();
    final description = descriptionController.text.trim();

    // Validation
    if (foodName.isEmpty) {
      AppSnackBar.showError("Food name is required");
      return;
    }

    if (selectedCategory.value == null) {
      AppSnackBar.showError("Please select a category");
      return;
    }

    if (price.isEmpty) {
      AppSnackBar.showError("Price is required");
      return;
    }

    // Validate that price is a valid number
    final parsedPrice = int.tryParse(price);
    if (parsedPrice == null) {
      AppSnackBar.showError("Price must be a valid number");
      return;
    }

    if (description.isEmpty) {
      AppSnackBar.showError("Description is required");
      return;
    }

    if (isOfferEnabled.value && offer.isEmpty) {
      AppSnackBar.showError(
        "Offer price is required when special offer is enabled",
      );
      return;
    }

    // Validate offer price if enabled
    final parsedOffer = isOfferEnabled.value ? int.tryParse(offer) : 0;
    if (isOfferEnabled.value && parsedOffer == null) {
      AppSnackBar.showError("Offer price must be a valid number");
      return;
    }

    isLoading.value = true;

    final requestBody = {
      "name": foodName,
      "description": description,
      "price": parsedPrice,
      "offerPrice": parsedOffer ?? 0,
      "category": selectedCategory.value!.name,
    };
    log("$requestBody");

    try {
      final uri = Uri.parse("${AppUrls.food}/$id");
      final request =
          http.MultipartRequest('PUT', uri)
            ..headers['Authorization'] = "Bearer ${AuthService.token}"
            ..fields['bodyData'] = jsonEncode(requestBody);

      if (pickedImage.value != null) {
        final file = pickedImage.value!;
        if (await file.exists()) {
          final extension = file.path.split('.').last.toLowerCase();
          if (['jpg', 'jpeg', 'png'].contains(extension)) {
            request.files.add(
              await http.MultipartFile.fromPath(
                'foodImage',
                file.path,
                contentType: MediaType('image', extension),
              ),
            );
          } else {
            AppSnackBar.showError("Unsupported image format: $extension");
            isLoading.value = false;
            return;
          }
        } else {
          AppSnackBar.showError("Selected image file does not exist");
          isLoading.value = false;
          return;
        }
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        Get.back();
        AppSnackBar.showSuccess("Menu Updated Successfully");
        await controller.fetchMenuData();
      } else {
        AppSnackBar.showError("Failed to update menu");
        log('Failed to update menu: ${response.body}');
      }
    } catch (e) {
      AppSnackBar.showError("Error updating menu: $e");
      AppLoggerHelper.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
