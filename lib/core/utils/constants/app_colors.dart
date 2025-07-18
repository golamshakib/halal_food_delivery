import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFF023621);
  static const Color secondary = Color(0xFF747474);
  static const Color accent = Color(0xFF89A7FF);
  static const Color black = Colors.black;

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0xfffffa9e), Color(0xFFFAD0C4), Color(0xFFFAD0C4)],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFFF2E8D1);
  static const Color textSecondary = Color(0xFF141414);
  static const Color textThird = Color(0xFF171717);
  static const Color white = Colors.white;

  // Background Colors
  static const Color backgroundLight = Color(0xFFF9FAFB);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color primaryBackground = Color(0xFFFFFFFF);

  // Surface Colors
  static const Color surfaceLight = Color(0xFFE0E0E0);
  static const Color surfaceDark = Color(0xFF2C2C2C);

  // Container Colors
  static const Color lightContainer = Color(0xFFF1F8E9);

  // Utility Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF29B6F6);

  // Shimmer Colors
  static const Color greyLight = Color(
    0xFFE0E0E0,
  ); // Added for shimmer base color
  static const Color greyLighter = Color(
    0xFFF5F5F5,
  ); // Added for shimmer highlight color
}
