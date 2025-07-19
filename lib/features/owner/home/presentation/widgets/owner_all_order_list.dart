// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
// import 'package:halal_food_delivery/core/utils/constants/image_path.dart';

// import '../../controllers/owner_home_controller.dart';
// import 'owner_custom_product_horizonational.dart';

// class OwnerAllOrderList extends StatelessWidget {
//   final OwnerHomeController controller = Get.put(OwnerHomeController());

//   OwnerAllOrderList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Column(
//         children: [
//           // SizedBox(height: 12.h),
//           // ...controller.foodItems.asMap().entries.map((entry) {
//           //   final item = entry.value;
//           //   final index = entry.key;
//           //   return Padding(
//           //     padding: EdgeInsets.only(bottom: 16.h),
//           //     child: OwnerCustomProductHorizonational(
//           //       isCheck: true,
//           //       image: item['image'] ?? ImagePath.chicken,
//           //       foodName: item['name'] ?? '',
//           //       price: item['price'] ?? '0.00',
//           //       star: item['rating'] ?? '0.0',
//           //       location: item['location'] ?? '0.0',
//           //       onTap: () {},
//           //       onCheckTap: () {
//           //         controller.addItem(index);
//           //       },
//           //       onDeleteTap: () {
//           //         controller.removeItem(index);
//           //       },
//           //     ),
//           //   );
//           // }),
//         ],
//       ),
//     );
//   }
// }
