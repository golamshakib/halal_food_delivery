import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/logo_path.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_button.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../authentication/presentation/widgets/custom_title_bar.dart';
import '../../controllers/role_select_controller.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RoleSelectionController());
    final roles = [Role.CUSTOMER, Role.RESTAURANT_OWNER, Role.DELIVERY_PARTNER];
    final labels = [
      AppText.customer.tr,
      AppText.restaurantOwner.tr,
      AppText.deliveryPartner.tr,
    ];

    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTitleBar(
                  title: AppText.chooseRole.tr,
                  left: 30.w,
                  subtitle: AppText.chooseRoleDesc.tr,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(LogoPath.blackLogo),
                ),
                SizedBox(height: 100.h),
                ...List.generate(
                  roles.length,
                  (i) => Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      right: 12.w,
                      bottom: i < roles.length - 1 ? 16.h : 0,
                    ),
                    child: Obx(() {
                      final selected = controller.isSelected(roles[i]);
                      return CustomButton(
                        onPressed: () {
                          controller.selectRole(roles[i]);
                          controller.proceedToSignup();
                        },
                        text: labels[i],
                        isIcon: true,
                        icon: Icons.arrow_forward_outlined,
                        backgroundColor:
                            selected ? AppColors.primary : AppColors.white,
                        borderColor:
                            selected ? AppColors.primary : Color(0xff141414),
                        textColor:
                            selected ? AppColors.textPrimary : AppColors.black,
                        iconColor:
                            selected ? AppColors.textPrimary : AppColors.black,
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
