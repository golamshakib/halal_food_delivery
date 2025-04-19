import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/icon_path.dart';

class CustomerNotificationBox extends StatelessWidget {
  final String messgeTitle;
  final String message;
  final String type;
  final String date;
  final String time;
  final VoidCallback? onTap;

  const CustomerNotificationBox({
    super.key,
    required this.messgeTitle,
    required this.message,
    required this.type,
    required this.date,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: type == "rate" ? onTap : null,
      child: Container(
        padding: EdgeInsets.fromLTRB(0.w, 16.h, 20.w, 16.h),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffE7E8EE))),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: Color(0xff747474).withAlpha(25),
                borderRadius: BorderRadius.circular(50.h),
              ),
              child: _getIconForType(type),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: messgeTitle,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    textOverflow: TextOverflow.ellipsis,
                    text: message,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    maxLines: 5,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Color(0xffCED1DD)),
                          ),
                        ),
                        child: CustomText(
                          text: date,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: time,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getIconForType(String type) {
    switch (type) {
      case "security":
        return Image.asset(IconPath.security, width: 24.w, height: 24.h);
      case "verify":
        return Image.asset(IconPath.profile, width: 24.w, height: 24.h);
      case "rate":
        return Image.asset(IconPath.message, width: 24.w, height: 24.h);
      default:
        return SizedBox();
    }
  }
}
