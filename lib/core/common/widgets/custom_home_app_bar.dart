import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/icon_path.dart';
import 'custom_text.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String? userImageUrl;
  final VoidCallback? onNotification;

  const CustomHomeAppBar({
    super.key,
    required this.userName,
    this.userImageUrl,
    this.onNotification,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // User avatar
          CircleAvatar(
            radius: 25,
            backgroundImage:
                userImageUrl != null ? NetworkImage(userImageUrl!) : null,
            child:
                userImageUrl == null
                    ? CustomText(
                      text: userName.isNotEmpty ? userName[0] : '',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff010101),
                    )
                    : null,
          ),
          SizedBox(width: 8.w),
          // User name and status
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Welcome,",
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff171717),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    IconPath.hand,
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 4.w),
                  CustomText(
                    text: userName,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff171717),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.h),
          child: GestureDetector(
            onTap: onNotification,
            child: Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: Color(0xffE7E7E7),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 24.sp,
                color: Color(0xff747474),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
