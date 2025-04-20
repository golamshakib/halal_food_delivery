import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

import '../../../../../core/common/widgets/custom_app.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/image_path.dart';
import '../../../home/presentation/widgets/customer_restaurants.dart';
import '../../controllers/customer_food_profile_controller.dart';
import '../widgets/customer_food_description.dart';
import '../widgets/customer_food_profile_image.dart';
import '../widgets/customer_restaurant_review.dart';

class CustomerFoodProfileScreen extends StatelessWidget {
  CustomerFoodProfileScreen({super.key});
  final controller = Get.put(CustomerFoodProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(
        istitle: true,
        title: "Profile",
        isLove: true,
        onPressed: () {},
      ),
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
                    Image.asset(
                      ImagePath.food,
                      width: double.infinity,
                      height: 187.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 12.h),
                    CustomerFoodProfileImage(),
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
                            _buildTabItem(index: 0, title: "Description"),
                            SizedBox(width: 4.w),
                            _buildTabItem(index: 1, title: "Review"),
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
                          CustomerFoodDescription(),
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
                    CustomerRestaurants(),
                    SizedBox(height: 20.h),
                    CustomText(
                      text: "Find nearby",
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: 343.w,
                      height: 218.h,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: controller.initialPosition,
                          zoom: 14.0,
                        ),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.customerPersonalInformationScreen);
                      },
                      text: "Order Now",
                      isIcon: true,
                      icon: Icons.arrow_forward,
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

  Widget _buildTabItem({required int index, required String title}) {
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
