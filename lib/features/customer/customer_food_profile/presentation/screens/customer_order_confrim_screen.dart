import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/icon_path.dart';
import 'package:halal_food_delivery/features/customer/customer_nav_bar/controllers/customer_nav_bar_controller.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';

class CustomerOrderConfrimScreen extends StatelessWidget {
  const CustomerOrderConfrimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 150.h),
              Image.asset(
                IconPath.done,
                width: 229.w,
                height: 226.h,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 72.h),
              CustomText(
                text: "Order placed successfully",
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 12.h),
              CustomText(
                textAlign: TextAlign.center,
                text:
                    "Thank you for your order! Your delicious meal is being prepared.",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff808080),
              ),
              Spacer(),
              CustomButton(
                onPressed: () {
                  Get.find<CustomerNavBarController>().changeIndex(0);
                  Get.toNamed(AppRoute.customerNavBar);
                },
                text: "Go to Home",
                isIcon: true,
                icon: Icons.arrow_forward,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
