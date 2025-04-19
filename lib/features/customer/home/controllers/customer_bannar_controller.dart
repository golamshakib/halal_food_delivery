import 'package:get/get.dart';

import '../../../../core/utils/constants/image_path.dart';

class CustomerBannarController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final List<String> bannerImages = [
    ImagePath.bannar,
    ImagePath.bannar,
    ImagePath.bannar,
  ];

  @override
  void onInit() {
    super.onInit();
    startAutoSlide();
  }

  void startAutoSlide() {
    Future.delayed(const Duration(seconds: 3), () {
      if (currentIndex.value < bannerImages.length - 1) {
        currentIndex.value++;
      } else {
        currentIndex.value = 0;
      }
      startAutoSlide();
    });
  }
}
