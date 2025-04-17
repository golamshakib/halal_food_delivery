import 'package:flutter/material.dart';
import 'package:halal_food_delivery/core/common/widgets/custom_app.dart';
import 'package:halal_food_delivery/core/utils/constants/app_sizer.dart';
import 'package:qr_bar_code/qr/src/qr_code.dart';

class OwnerOrderScanScreen extends StatelessWidget {
  const OwnerOrderScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp(istitle: true, title: "Scan QR Code"),
      body: Center(child: QRCode(size: 240.sp, data: "https://datadirr.com")),
    );
  }
}
