import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../controller/delivery_order_scan_controller.dart';

class DeliveryOrderScanScreen extends StatelessWidget {
  DeliveryOrderScanScreen({super.key});

  final DeliveryOrderScanController controller = Get.put(
    DeliveryOrderScanController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Scan QR Code"),
      body: Stack(
        children: [
          _buildScannerView(),
          _buildScanOverlay(context),
          _buildFlashlightToggle(),
        ],
      ),
    );
  }

  Widget _buildScannerView() {
    return MobileScanner(
      controller: controller.scannerController,
      onDetect: controller.handleDetection,
    );
  }

  Widget _buildScanOverlay(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() {
              if (controller.isProcessing.value) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildFlashlightToggle() {
    return Positioned(
      bottom: 30,
      right: 20,
      child: Obx(
        () => IconButton(
          icon: Icon(
            controller.isFlashOn.value ? Icons.flash_on : Icons.flash_off,
            color: Colors.white,
            size: 30,
          ),
          onPressed: controller.toggleFlash,
        ),
      ),
    );
  }
}
