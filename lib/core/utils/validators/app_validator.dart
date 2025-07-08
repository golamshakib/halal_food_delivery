import 'package:get/get.dart';

import '../constants/app_texts.dart';

class AppValidator {
  AppValidator._();

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppText.emailRequired.tr;
    }
    final emailRegExp = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return AppText.invalidEmailAddress.tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppText.passwordRequired.tr;
    }
    if (value.length < 6) {
      return AppText.passwordMinLength.tr;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return AppText.passwordUppercase.tr;
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return AppText.passwordNumber.tr;
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return AppText.passwordSpecialChar.tr;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppText.phoneNumberRequired.tr;
    }
    final phoneRegExp = RegExp(r'^\d{11}$');
    if (!phoneRegExp.hasMatch(value)) {
      return AppText.invalidPhoneNumber.tr;
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppText.nameRequired.tr;
    }
    if (value.length < 2) {
      return AppText.nameMinLength.tr;
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppText.usernameRequired.tr;
    }
    final usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{3,15}$');
    if (!usernameRegExp.hasMatch(value)) {
      return AppText.invalidUsername.tr;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String? originalPassword,
  ) {
    if (value == null || value.isEmpty) {
      return AppText.confirmPasswordRequired.tr;
    }
    if (value != originalPassword) {
      return AppText.passwordsDoNotMatch.tr;
    }
    return null;
  }

  static String? validateNotEmpty(
    String? value, [
    String fieldName = 'This field',
  ]) {
    if (value == null || value.trim().isEmpty) {
      return AppText.fieldRequired.tr.replaceFirst('%s', fieldName);
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppText.addressRequired.tr;
    }
    if (value.length < 10) {
      return AppText.addressMinLength.tr;
    }
    return null;
  }

  static String? validateZipCode(String? value) {
    if (value == null || value.isEmpty) {
      return AppText.zipCodeRequired.tr;
    }
    final zipRegExp = RegExp(r'^\d{4,6}$');
    if (!zipRegExp.hasMatch(value)) {
      return AppText.invalidZipCode.tr;
    }
    return null;
  }
}
