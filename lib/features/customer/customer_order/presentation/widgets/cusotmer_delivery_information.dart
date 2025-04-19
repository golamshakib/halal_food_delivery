import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
// import 'package:halal_food_delivery/features/delivery/delivery_nav_bar/controllers/delivery_nav_bar_controller.dart';
import 'cusotmer_order_detail_product.dart';
// import 'package:halal_food_delivery/routes/app_routes.dart';

class CusotmerDeliveryInformation extends StatelessWidget {
  const CusotmerDeliveryInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 113.w),
            child: Divider(color: const Color(0xffE2E2E2), height: 8.h),
          ),
          SizedBox(height: 16.h),
          Center(
            child: Column(
              children: [
                CustomText(
                  text: "Estimated Arrival Time",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff808080),
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: "12:30 PM - 01:00 PM",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff121212),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Divider(color: AppColors.black.withAlpha(25)),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      ImagePath.delivery,
                      width: 48.w,
                      height: 48.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "John Doe",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 4.h),
                      CustomText(
                        text: "Delivery Man",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff808080),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(24.h),
                  ),
                  child: Icon(
                    Icons.phone,
                    size: 24.sp,
                    color: AppColors.primary,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.h),
              border: Border.all(color: Color(0xff000000).withAlpha(25)),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.h),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 2.w,
                        ),
                      ),
                      child: Icon(
                        Icons.circle,
                        size: 12.sp,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                      child: VerticalDivider(
                        width: 3.w,
                        color: Color(0xff000000).withAlpha(25),
                      ),
                    ),
                    Icon(Icons.place, size: 24.sp, color: AppColors.primary),
                  ],
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Shop",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: 265.w,
                      child: Divider(color: Color(0xff000000).withAlpha(25)),
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: " 1234 Main Street, Springfield, NY....",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          CustomText(text: "Order Details"),
          SizedBox(height: 12.h),
          CusotmerOrderDetailProduct(
            image: ImagePath.chicken,
            foodName: 'Veggie Chicken',
            price: '479',
            star: '4.8',
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
