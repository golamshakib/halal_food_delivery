import 'dart:developer';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/services/Auth_service.dart';
import 'package:halal_food_delivery/core/services/network_caller.dart';
import 'package:halal_food_delivery/core/utils/constants/app_snackbar.dart';
import 'package:halal_food_delivery/core/utils/constants/app_urls.dart';
import 'package:halal_food_delivery/core/utils/logging/logger.dart';
import '../model/menu_model.dart';

class OwnerHomeController extends GetxController {
  var isLoading = false.obs;
  var menuModel = Rxn<MenuModel>();


  Future<void> fetchMenuData() async {
    isLoading.value = true;
    try {
      final response = await NetworkCaller().getRequest(
        AppUrls.food,
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

  void removeItem(String id) async {
    try {
      isLoading.value = true;
      // Assuming an API endpoint to delete an item by ID
      final response = await NetworkCaller().deleteRequest(
        "${AppUrls.food}/$id",
        "Bearer ${AuthService.token}",
      );
      if (response.isSuccess) {
        menuModel.value?.data?.removeWhere((item) => item.id == id);
        menuModel.refresh(); // Notify UI of changes
        AppSnackBar.showSuccess("Items Remove Successfully");
      } else {
        AppSnackBar.showError("Failed to remove item");
        AppLoggerHelper.error(
          "Failed to delete item: ${response.responseData['message']}",
        );
      }
    } catch (e) {
      log("Delete item error: $e");
      AppLoggerHelper.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<Data> get firstTenItems =>
      menuModel.value?.data?.take(10).toList() ?? [];
}
