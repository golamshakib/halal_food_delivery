import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/services/Auth_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../../../core/utils/logging/logger.dart';
import '../../../owner/home/model/menu_model.dart';

class CustomerSearchController extends GetxController {
  final searchController = TextEditingController();
  var menuModel = Rxn<MenuModel>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Clear the search text when the controller is initialized
    searchController.clear();
  }

  Future<void> fetchMenuData() async {
    final search = searchController.text.trim();
    isLoading.value = true;
    try {
      final response = await NetworkCaller().getRequest(
        "${AppUrls.food}?search=$search",
        token: "Bearer ${AuthService.token}",
      );
      if (response.isSuccess) {
        menuModel.value = MenuModel.fromJson(response.responseData);
      } else {
        AppLoggerHelper.error(
          "Failed to fetch menu: ${response.responseData['message']}",
        );
      }
    } catch (e) {
      log("Fetch menu error: $e");
      AppLoggerHelper.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
