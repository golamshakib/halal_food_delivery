import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';

class CustomerFoodDescription extends StatelessWidget {
  const CustomerFoodDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text:
              "Veggie Chicken is a plant-based alternative that mimics the taste and texture of real chicken, made from ingredients like soy, wheat, or pea protein. Perfect for vegetarians and vegans!",
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
