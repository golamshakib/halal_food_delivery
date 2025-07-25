import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halal_food_delivery/core/utils/constants/app_urls.dart';
import 'package:http/http.dart' as http;

import '../../../core/utils/constants/app_snackbar.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/logging/logger.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

import '../presentation/screens/verify_screen.dart';

class SingUpController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final locationController = TextEditingController();

  var isPasswordVisible = false.obs;
  final Rx<LatLng?> userLocation = Rx<LatLng?>(null);

  Rx<File?> pickedFile = Rx<File?>(null); // For license document
  Rx<File?> pickedFile2 = Rx<File?>(null); // For signature document
  var selectedLatLng = Rxn<LatLng>();
  var selectedAddress = ''.obs;
  var isMapVisible = false.obs;
  final RxBool isLoading = false.obs;
  final signUpFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleMapVisibility() {
    isMapVisible.value = !isMapVisible.value;
  }

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      pickedFile.value = File(result.files.single.path!);
    }
  }

  Future<void> pickDocument1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      pickedFile2.value = File(result.files.single.path!);
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        AppSnackBar.showError(AppText.locationServicesDisabled.tr);
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          AppSnackBar.showError(AppText.locationPermissionDenied.tr);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        AppSnackBar.showError(AppText.locationPermissionPermanentlyDenied.tr);
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      userLocation.value = LatLng(position.latitude, position.longitude);
    } catch (e) {
      log("Error getting location: $e");
      AppSnackBar.showError(
        AppText.errorGettingLocation.trParams({'': e.toString()}),
      );
    }
  }

  Future<void> handleMapTap(LatLng latLng) async {
    selectedLatLng.value = latLng;

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String fullAddress =
            "${place.street}, ${place.locality}, ${place.country}";

        selectedAddress.value = fullAddress;
        locationController.text = fullAddress;
      }
    } catch (e) {
      AppLoggerHelper.error(e.toString());
      AppSnackBar.showError(
        AppText.errorFetchingAddress.trParams({'': e.toString()}),
      );
    }
  }

  Future<void> signUp(Role role) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final location = locationController.text.trim();
    final name = nameController.text.trim();

    if (name.isEmpty) {
      AppSnackBar.showError(AppText.nameCannotBeEmpty.tr);
      return;
    }

    if (email.isEmpty) {
      AppSnackBar.showError(AppText.emailCannotBeEmpty.tr);
      return;
    }

    if (location.isEmpty) {
      AppSnackBar.showError(AppText.locationCannotBeEmpty.tr);
      return;
    }
    if (password.isEmpty) {
      AppSnackBar.showError(AppText.passwordCannotBeEmpty.tr);
      return;
    }

    if (role == Role.RESTAURANT_OWNER &&
        pickedFile.value == null &&
        pickedFile2.value == null) {
      AppSnackBar.showError(AppText.uploadRestaurantDocuments.tr);
      return;
    }

    if (selectedLatLng.value == null) {
      AppSnackBar.showError(AppText.selectLocation.tr);
      return;
    }

    isLoading.value = true;

    final requestBody = {
      "email": email,
      "name": name,
      "password": password,
      "role": role.toString().split('.').last, // Convert enum to string
      "location": location,
      'latitude': selectedLatLng.value!.latitude,
      'longitude': selectedLatLng.value!.longitude,
    };

    log("$requestBody");

    try {
      final uri = Uri.parse(AppUrls.create);
      final request = http.MultipartRequest('POST', uri)
        ..fields['bodyData'] = jsonEncode(requestBody);

      // Add license document if available
      if (pickedFile.value != null) {
        final extension = pickedFile.value!.path.split('.').last.toLowerCase();
        if (['jpg', 'jpeg', 'png'].contains(extension)) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'license',
              pickedFile.value!.path,
              contentType: MediaType('image', extension),
            ),
          );
        }
      }

      // Add signature document if available
      if (pickedFile2.value != null) {
        final extension = pickedFile2.value!.path.split('.').last.toLowerCase();
        if (['jpg', 'jpeg', 'png'].contains(extension)) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'signature',
              pickedFile2.value!.path,
              contentType: MediaType('image', extension),
            ),
          );
        }
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        AppSnackBar.showSuccess(AppText.signUpSuccessful.tr);
        Get.to(
          () => VerifyScreen(role: role, screen: Screen.singUp, email: email),
        );
        clearForm();
      } else if (response.statusCode == 409) {
        AppSnackBar.showError(AppText.userAlreadyExists.tr);
        log("User already exists: ${response.body}");
      } else {
        AppSnackBar.showError(
          AppText.failedToSignUp.trParams({'': response.body}),
        );
        log("Failed to sign up: ${response.body}");
      }
    } catch (e) {
      AppSnackBar.showError(
        AppText.errorSigningUp.trParams({'': e.toString()}),
      );
      AppLoggerHelper.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void clearForm() {
    emailController.clear();
    passwordController.clear();
    locationController.clear();
    pickedFile.value = null;
    pickedFile2.value = null;
    selectedLatLng.value = null;
    selectedAddress.value = '';
  }
}
