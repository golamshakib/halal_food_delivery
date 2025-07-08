import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_colors.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';
import 'package:halal_food_delivery/core/utils/constants/image_path.dart';

import '../../controllers/lanauage_controller.dart';

class LanguageSelection extends StatelessWidget {
  LanguageSelection({super.key});
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // English option
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.h),
                border: Border.all(color: Color.fromRGBO(126, 31, 127, 0.25)),
              ),
              child: _buildLanguageOption(
                flagAsset: ImagePath.english,
                language: AppText.english.tr,
                languageCode: 'en',
                controller: languageController,
              ),
            ),
            SizedBox(height: 11.h),

            // Arabic option
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.h),
                border: Border.all(color: Color.fromRGBO(126, 31, 127, 0.25)),
              ),
              child: _buildLanguageOption(
                flagAsset: ImagePath.arabic,
                language: AppText.arabic.tr,
                languageCode: 'ar',
                controller: languageController,
              ),
            ),
            SizedBox(height: 11.h),

            // French option
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.h),
                border: Border.all(color: Color.fromRGBO(126, 31, 127, 0.25)),
              ),
              child: _buildLanguageOption(
                flagAsset: ImagePath.french,
                language: AppText.french.tr,
                languageCode: 'fr',
                controller: languageController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required String flagAsset,
    required String language,
    required String languageCode,
    required LanguageController controller,
  }) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.changeLanguage(languageCode),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            children: [
              // Flag image
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  flagAsset,
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomText(text: language, fontWeight: FontWeight.w400),
              ),
              Radio<String>(
                value: languageCode,
                groupValue: controller.selectedLanguage.value,
                onChanged: (value) => controller.changeLanguage(value!),
                activeColor: AppColors.primary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
