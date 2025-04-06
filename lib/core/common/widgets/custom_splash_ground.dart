import 'package:flutter/material.dart';

class CustomSplashGround extends StatelessWidget {
  const CustomSplashGround({super.key, required this.child, required this.imagePath});

  final Widget child;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: screenSize.width,
            height: screenSize.height,
          ),
          child,
        ],
      ),
    );
  }
}