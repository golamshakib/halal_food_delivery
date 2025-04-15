import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

class CustomerTerms extends StatelessWidget {
  const CustomerTerms({super.key});

  Widget _buildTerm(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Icon(Icons.circle, size: 6.sp, color: Colors.black),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$title\n",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  TextSpan(
                    text: content,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff656565),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          _buildTerm(
            "User Responsibilities:",
            "Users are responsible for providing accurate information when booking appointments. Rescheduling or canceling appointments must be done at least 24 hours in advance.",
          ),
          _buildTerm(
            "Service Usage:",
            "The app is designed to assist users in scheduling and managing interior design appointments. Unauthorized use or tampering with the app is strictly prohibited.",
          ),
          _buildTerm(
            "Third-Party Services:",
            "The app may connect users with third-party interior design professionals. The app does not assume responsibility for the services provided by these professionals.",
          ),
        ],
      ),
    );
  }
}
