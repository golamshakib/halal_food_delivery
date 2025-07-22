import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/icon_path.dart';
import 'package:halal_food_delivery/routes/app_routes.dart';
import '../../../../owner/owner_profile/presentation/screens/owner_edit_profile_screen.dart';
import 'delivery_logout_bottom_sheet.dart';

class DeliveryProfileList extends StatelessWidget {
  const DeliveryProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _ListItem(
        icon: IconPath.user,
        text: "Your profile",
        onPressed: () {
          Get.to(() => OwnerEditProfileScreen(isOwner: false));
        },
      ),
      _ListItem(
        icon: IconPath.key,
        text: "Password Manager",
        onPressed: () {
          Get.toNamed(AppRoute.ownerChangePasswordScreen);
        },
      ),
      _ListItem(
        icon: IconPath.lock,
        text: "Privacy Policy",
        onPressed: () {
          Get.toNamed(AppRoute.deliveryPolicyScreen);
        },
      ),
      _ListItem(
        icon: IconPath.user,
        text: "Log out",
        showDivider: false,
        onPressed: () {
          DeliveryLogoutBottomSheet.showDeliveryLogoutBottomSheet(context);
        },
      ),
    ];

    return Column(children: items.map((item) => _buildListItem(item)).toList());
  }

  Widget _buildListItem(_ListItem item) {
    return Column(
      children: [
        GestureDetector(
          onTap: item.onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(item.icon, width: 24.w, height: 24.h),
                    SizedBox(width: 12.w),
                    CustomText(
                      text: item.text,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff121212),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 21.sp),
              ],
            ),
          ),
        ),
        if (item.showDivider) const Divider(),
      ],
    );
  }
}

class _ListItem {
  final String icon;
  final String text;
  final bool showDivider;
  final VoidCallback onPressed;

  _ListItem({
    required this.icon,
    required this.text,
    required this.onPressed,
    this.showDivider = true,
  });
}
