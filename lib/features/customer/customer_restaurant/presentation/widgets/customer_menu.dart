import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_text.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utils/constants/enums.dart';
import '../../../../../core/utils/constants/image_path.dart';
import '../../../customer_my_list/presentation/widgets/customer_custom_product_vertical.dart';
import '../../controllers/customer_menu_controller.dart';

class CustomerMenu extends StatelessWidget {
  final String id;
  final Category category;

  CustomerMenu({super.key, required this.id, required this.category});
  final controller = Get.put(CustomerMenuController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMenuByCategory(id, category);
    });

    return Obx(
      () =>
          controller.isLoading.value
              ? _buildShimmerGrid(context)
              : SingleChildScrollView(
                child:
                    controller.foodCategoryModel.value?.data?.isEmpty ?? true
                        ? Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CustomText(
                              text: 'No ${category.displayText} items found',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                        : GridView.count(
                          childAspectRatio: 0.55,
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.w,
                          mainAxisSpacing: 20.h,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children:
                              controller.foodCategoryModel.value!.data!.map((
                                item,
                              ) {
                                return CustomerCustomProductVertical(
                                  image: item.image ?? ImagePath.chicken,
                                  foodName: item.name ?? '',
                                  offerPrice:
                                      item.offerPrice != null
                                          ? item.offerPrice!.toDouble()
                                          : 0.0,
                                  price: item.price?.toString() ?? '0.00',
                                  star: item.averageRating?.toString() ?? '0.0',
                                );
                              }).toList(),
                        ),
              ),
    );
  }

  Widget _buildShimmerGrid(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        childAspectRatio: 0.55,
        crossAxisCount: 2,
        crossAxisSpacing: 4.w,
        mainAxisSpacing: 20.h,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          4,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(height: 16.h, width: 80.w, color: Colors.grey[300]),
                  SizedBox(height: 4.h),
                  Container(height: 16.h, width: 50.w, color: Colors.grey[300]),
                  SizedBox(height: 4.h),
                  Container(height: 16.h, width: 30.w, color: Colors.grey[300]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
