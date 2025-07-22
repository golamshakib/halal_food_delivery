import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text_field.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/common/widgets/custom_home_app_bar.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../owner/owner_profile/controllers/owner_edit_profile_controller.dart';
import '../../controllers/customer_home_controller.dart';
import '../widgets/customer_home_bannar.dart';
import '../widgets/customer_nearby_restaurants.dart';
import '../widgets/customer_offers.dart';

class CustomerHomeScreen extends StatelessWidget {
  CustomerHomeScreen({super.key});
  final controller = Get.put(CustomerHomeController());
  final profileController = Get.put(OwnerEditProfileController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.fetchProfileData("Name is Customer Screen");
      controller.fetchnearbyRestaurant();
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Obx(
          () => CustomHomeAppBar(
            userName: profileController.profileModel.value?.data?.name ?? '',
            userImageUrl: profileController.profileModel.value?.data?.image,
            onNotification: () {
              Get.toNamed(AppRoute.ownerNotificationScreen);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomerHomeBannar(),
              SizedBox(height: 20.h),
              CustomTextField(
                textColor: Color(0xffD9D9D9),
                borderColor: Color(0xff808080),
                controller: TextEditingController(),
                hintText: "Search for food...",
                readOnly: true,
                onTap: () {
                  Get.toNamed(AppRoute.customerSearchScreen);
                },
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xffD9D9D9),
                  size: 24.sp,
                ),
              ),
              SizedBox(height: 20.h),
              CustomText(text: "Best Offers", fontWeight: FontWeight.w600),
              SizedBox(height: 12.h),
              CustomerOffers(),
              SizedBox(height: 20.h),
              CustomText(
                text: "Restaurants Nearby",
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 12.h),
              CustomerNearbyRestaurants(),
              SizedBox(height: 20.h),
              CustomText(text: "Find nearby", fontWeight: FontWeight.w600),
              SizedBox(height: 12.h),
              Obx(
                () =>
                    controller.isLoading.value
                        ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 343.w,
                            height: 218.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        )
                        : SizedBox(
                          width: 343.w,
                          height: 218.h,
                          child: GoogleMap(
                            onMapCreated: controller.onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: controller.initialPosition.value,
                              zoom: 14.0,
                            ),
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            zoomControlsEnabled: true,
                            zoomGesturesEnabled: true,
                            scrollGesturesEnabled: true,
                            tiltGesturesEnabled: true,
                            rotateGesturesEnabled: true,
                            markers: controller.markers,
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
