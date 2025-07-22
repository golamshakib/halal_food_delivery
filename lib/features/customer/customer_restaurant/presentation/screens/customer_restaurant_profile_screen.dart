import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../home/presentation/widgets/customer_other_restaurants.dart';
import '../../controllers/customer_restaurant_profile_controller.dart';
import '../widgets/customer_restaurant_description.dart';
import '../widgets/customer_restaurant_review.dart';
import '../widgets/customer_resturant_profile_image.dart';

class CustomerRestaurantProfileScreen extends StatelessWidget {
  final String id;
  const CustomerRestaurantProfileScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // Use a unique tag for the controller based on the restaurant ID
    final controller = Get.put(CustomerRestaurantProfileController(), tag: id);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchRestaurantSingle(id);
    });
    log("Id is $id");
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Profile"),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () =>
                          controller.isLoading.value
                              ? Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: double.infinity,
                                  height: 187.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              )
                              : controller.restaurantModel.value == null
                              ? Center(
                                child: CustomText(
                                  text: "Failed to load restaurant data",
                                  color: AppColors.error,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                              : Image.network(
                                controller
                                        .restaurantModel
                                        .value
                                        ?.data
                                        ?.result
                                        ?.image ??
                                    ImagePath.placeholder,
                                width: double.infinity,
                                height: 187.h,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) => Image.asset(
                                      ImagePath.placeholder,
                                      width: double.infinity,
                                      height: 187.h,
                                      fit: BoxFit.cover,
                                    ),
                              ),
                    ),
                    SizedBox(height: 12.h),
                    CustomerResturantProfileImage(id: id),
                    SizedBox(height: 24.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: EdgeInsets.all(4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.h),
                        ),
                        child: Row(
                          children: [
                            _buildTabItem(
                              index: 0,
                              title: "Description",
                              controller: controller,
                            ),
                            SizedBox(width: 4.w),
                            _buildTabItem(
                              index: 1,
                              title: "Review",
                              controller: controller,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.47,
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        children: [
                          CustomerRestaurantDescription(),
                          CustomerRestaurantReview(),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomText(
                      text: "Other Restaurants",
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 12.h),
                    CustomerOtherRestaurants(id: id),
                    SizedBox(height: 20.h),
                    CustomText(
                      text: "Find nearby",
                      fontWeight: FontWeight.w600,
                    ),
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
                              : controller.restaurantModel.value == null
                              ? Center(
                                child: CustomText(
                                  text: "Failed to load map data",
                                  color: AppColors.error,
                                  fontWeight: FontWeight.w600,
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
        },
      ),
    );
  }

  Widget _buildTabItem({
    required int index,
    required String title,
    required CustomerRestaurantProfileController controller,
  }) {
    return InkWell(
      onTap: () => controller.changeTab(index),
      child: Obx(() {
        final isSelected = controller.selectedTab.value == index;
        return Container(
          width: 172.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.h),
            color: isSelected ? AppColors.primary : null,
          ),
          child: CustomText(
            textAlign: TextAlign.center,
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.textPrimary : AppColors.black,
          ),
        );
      }),
    );
  }
}
