import 'package:get/get.dart';
import '../../../../../core/utils/constants/enums.dart';

class CustomerPaymentController extends GetxController {
  Rx<PaymentSystem?> selectedSystem = Rx<PaymentSystem?>(null);
  Rx<PaymentMethod?> selectedMethod = Rx<PaymentMethod?>(null);
  RxBool isPayment = false.obs;
}
