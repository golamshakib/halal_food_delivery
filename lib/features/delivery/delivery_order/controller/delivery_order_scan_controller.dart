import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_snackbar.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class DeliveryOrderScanController extends GetxController {
  final Rx<String?> scannedResult = Rx<String?>(null);
  final RxBool isFlashOn = false.obs;
  final RxBool isProcessing = false.obs;
  final MobileScannerController scannerController = MobileScannerController();

  void handleDetection(BarcodeCapture barcode) {
    if (!isProcessing.value && barcode.barcodes.isNotEmpty) {
      isProcessing.value = true;
      scannedResult.value = barcode.barcodes.first.rawValue;
      isProcessing.value = false;

      // Show success message
      if (scannedResult.value != null) {
        AppSnackBar.showSuccess('Scanned data: ${scannedResult.value}');
      }
    }
  }

  Future<void> toggleFlash() async {
    try {
      await scannerController.toggleTorch();
      isFlashOn.value = !isFlashOn.value;
    } catch (e) {
      AppSnackBar.showError('Failed to toggle flash: $e');
    }
  }

  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
}
