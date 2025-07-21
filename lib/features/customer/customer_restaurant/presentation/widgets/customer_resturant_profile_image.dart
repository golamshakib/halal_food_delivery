import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/image_path.dart';
import '../../controllers/customer_restaurant_profile_controller.dart';

class CustomerResturantProfileImage extends StatelessWidget {
  final String id;
  CustomerResturantProfileImage({super.key, required this.id});
  final controller = Get.put(CustomerRestaurantProfileController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchRestaurantSingle(id);
    });
    return Obx(
      () =>
          controller.isLoading.value || controller.restaurantModel.value == null
              ? _buildShimmerPlaceholder()
              : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              controller
                                      .restaurantModel
                                      .value
                                      ?.data
                                      ?.result
                                      ?.image ??
                                  "",
                              width: 40.w,
                              height: 40.h,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) => Image.asset(
                                    ImagePath.placeholder,
                                    width: 40.w,
                                    height: 40.h,
                                    fit: BoxFit.cover,
                                  ),
                            ),
                          ),
                          SizedBox(width: 8.h),
                          CustomText(
                            text:
                                controller
                                    .restaurantModel
                                    .value
                                    ?.data
                                    ?.result
                                    ?.name ??
                                "",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff121212).withAlpha(179),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate,
                            color: Color(0xffFF8610),
                            size: 24.sp,
                          ),
                          SizedBox(width: 8.h),
                          CustomText(
                            text:
                                controller
                                    .restaurantModel
                                    .value
                                    ?.data
                                    ?.averageRating
                                    ?.toStringAsFixed(1) ??
                                "0.0",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff4F4F4F),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Icon(Icons.place, color: AppColors.primary, size: 24.sp),
                      SizedBox(width: 14.h),
                      CustomText(
                        text:
                            controller
                                .restaurantModel
                                .value
                                ?.data
                                ?.result
                                ?.location ??
                            '',
                        fontSize: 14.sp,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff242424),
                      ),
                    ],
                  ),
                ],
              ),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Container(width: 100.w, height: 20.h, color: Colors.white),
                ],
              ),
              Row(
                children: [
                  Container(width: 24.w, height: 24.h, color: Colors.white),
                  SizedBox(width: 8.h),
                  Container(width: 30.w, height: 16.h, color: Colors.white),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 120.w, height: 20.h, color: Colors.white),
              Container(width: 60.w, height: 14.h, color: Colors.white),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Container(width: 24.w, height: 24.h, color: Colors.white),
              SizedBox(width: 14.h),
              Container(width: 200.w, height: 14.h, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
