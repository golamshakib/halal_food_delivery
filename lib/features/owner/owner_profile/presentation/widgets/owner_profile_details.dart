import 'package:flutter/cupertino.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';

class OwnerProfileDetails extends StatelessWidget {
  const OwnerProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              ImagePath.owner,
              width: 120.w,
              height: 120.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.h),
          CustomText(text: "Foraged Fare", color: AppColors.textThird),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: CustomText(
              textAlign: TextAlign.center,
              text: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
              color: AppColors.textThird,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
