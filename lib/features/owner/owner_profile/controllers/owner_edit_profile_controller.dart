import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/Auth_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/utils/constants/app_snackbar.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../../../core/utils/logging/logger.dart';
import '../model/profile_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

class OwnerEditProfileController extends GetxController {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  var isLoading = false.obs;
  var pickedImage = Rx<File?>(null);
  var profileImageUrl = Rx<String?>(null);
  var isMapVisible = false.obs;
  var profileModel = Rxn<ProfileModel>();
  final Rx<LatLng?> userLocation = Rx<LatLng?>(null);
  var selectedLatLng = Rxn<LatLng>();
  var selectedAddress = ''.obs;

  void toggleMapVisibility() {
    isMapVisible.value = !isMapVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchProfileData("Name is Controller");
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }

  Future<void> fetchProfileData(String name) async {
    isLoading.value = true;
    log(name);
    try {
      final response = await NetworkCaller().getRequest(
        AppUrls.user,
        token: "Bearer ${AuthService.token}",
      );
      if (response.isSuccess) {
        profileModel.value = ProfileModel.fromJson(response.responseData);
        nameController.text = profileModel.value?.data?.name ?? "";
        locationController.text = profileModel.value?.data?.location ?? '';
        descriptionController.text =
            profileModel.value?.data?.description ?? '';
        profileImageUrl.value = profileModel.value?.data?.image ?? '';

        // Check if latitude and longitude are available and valid
        final latitudeStr = profileModel.value?.data?.latitude;
        final longitudeStr = profileModel.value?.data?.longitude;
        if (latitudeStr != null && longitudeStr != null) {
          try {
            final latitude = latitudeStr;
            final longitude = longitudeStr;
            selectedLatLng.value = LatLng(latitude, longitude);
          } catch (e) {
            log("Error parsing latitude/longitude: $e");
            AppSnackBar.showError("Invalid location data");
          }
        } else {
          selectedLatLng.value = null; // Reset if no valid data
        }
      }
    } catch (e) {
      log("Fetch profile error: $e");
      AppLoggerHelper.error(e.toString());
    } finally {
      isLoading.value = false;
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

  Future<void> profileUpdate() async {
    final name = nameController.text.trim();
    final location = locationController.text.trim();
    final description = descriptionController.text.trim();

    isLoading.value = true;

    // Check if selectedLatLng is not null before accessing latitude and longitude
    if (selectedLatLng.value == null) {
      AppSnackBar.showError("Location is not selected");
      isLoading.value = false;
      return;
    }

    // Convert latitude and longitude to double
    final requestBody = {
      "name": name,
      "location": location,
      "description": description,
      'latitude': selectedLatLng.value!.latitude, // Send as double, not string
      'longitude':
          selectedLatLng.value!.longitude, // Send as double, not string
    };

    log("$requestBody");
    try {
      final uri = Uri.parse(AppUrls.user);
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
                'profileImage',
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
        AppSnackBar.showSuccess("Profile Update Successfully");
        fetchProfileData("Name is not Controller");
      } else {
        AppSnackBar.showError("Failed to update profile");
        log('Failed to update the user: ${response.body}');
      }
    } catch (e) {
      AppSnackBar.showError("Error to update the profile $e");
      AppLoggerHelper.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
