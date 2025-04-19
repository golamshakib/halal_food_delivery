import 'package:get/get.dart';

import '../../../../core/utils/constants/image_path.dart';

class CustomerReviewController extends GetxController {
  final List<Map<String, String>> review =
      [
        {
          'image': ImagePath.customer,
          'name': 'Devon Lane',
          'rating': '4.8',
          'message':
              ' Absolutely delicious! The veggie chicken had the perfect texture and flavor—just like real chicken. It was juicy, well-seasoned, and great in my stir-fry. Will definitely buy again!',
        },
        {
          'image': ImagePath.customer,
          'name': 'Devon Lane',
          'rating': '4.8',
          'message':
              ' Absolutely delicious! The veggie chicken had the perfect texture and flavor—just like real chicken. It was juicy, well-seasoned, and great in my stir-fry. Will definitely buy again!',
        },
        {
          'image': ImagePath.customer,
          'name': 'Devon Lane',
          'rating': '4.8',
          'message':
              ' Absolutely delicious! The veggie chicken had the perfect texture and flavor—just like real chicken. It was juicy, well-seasoned, and great in my stir-fry. Will definitely buy again!',
        },
      ].obs;

  List<Map<String, String>> get firstTenReview => review.take(3).toList();
}
