import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';
import 'package:shimmer/shimmer.dart';
import '../../controllers/owner_edit_profile_controller.dart';

class OwnerProfileDetails extends StatelessWidget {
  OwnerProfileDetails({super.key});

  final controller = Get.put(OwnerEditProfileController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProfileData("Name is Owner Profile Screen");
    });
    return Obx(() {
      return Align(
        alignment: Alignment.topCenter,
        child:
            controller.isLoading.value
                ? _buildShimmer()
                : _buildProfileContent(),
      );
    });
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.greyLight,
      highlightColor: AppColors.greyLighter,
      child: Column(
        children: [
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 20.h),
          Container(width: 100.w, height: 16.h, color: AppColors.white),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Container(
              width: double.infinity,
              height: 14.h,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent() {
    final profile = controller.profileModel.value?.data;
    return Column(
      children: [
        ClipOval(
          child:
              profile?.image != null
                  ? Image.network(
                    profile!.image!,
                    width: 120.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        ImagePath.background,
                        width: 120.w,
                        height: 120.h,
                        fit: BoxFit.cover,
                      );
                    },
                  )
                  : Image.asset(
                    ImagePath.background,
                    width: 120.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                  ),
        ),
        SizedBox(height: 20.h),
        CustomText(text: profile?.name ?? "", color: AppColors.textThird),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: CustomText(
            textAlign: TextAlign.center,
            text: profile?.location ?? "",
            color: AppColors.textThird,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
