// ignore_for_file: file_names

import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../../features/authentication/presentation/screens/login_screen.dart';
import '../utils/constants/enums.dart';

class AuthService {
  static const String _tokenKey = 'token';
  static const String _userIdKey = 'userId';
  static const String _roleKey = 'role';

  // Singleton instance for SharedPreferences
  static late SharedPreferences _preferences;

  // Private variables to hold token, userId, and role
  static String? _token;
  static String? _userId;
  static String? _role;

  // Initialize SharedPreferences (call this during app startup)
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    // Load token, userId, and role from SharedPreferences into private variables
    _token = _preferences.getString(_tokenKey);
    _userId = _preferences.getString(_userIdKey);
    _role = _preferences.getString(_roleKey);
  }

  // Check if a token exists in local storage
  static bool hasToken() {
    return _preferences.containsKey(_tokenKey);
  }

  // Save the token, user ID, and role to local storage
  static Future<void> saveToken(String token, String userId, Role role) async {
    try {
      await _preferences.setString(_tokenKey, token);
      await _preferences.setString(_userIdKey, userId);
      await _preferences.setString(_roleKey, role.toString());
      // Update private variables
      _token = token;
      _userId = userId;
      _role = role.toString();
    } catch (e) {
      log('Error saving auth data: $e');
    }
  }

  // Clear authentication data (for logout or clearing auth data)
  static Future<void> logoutUser() async {
    try {
      // Clear all data from SharedPreferences
      await _preferences.clear();

      // Reset private variables
      _token = null;
      _userId = null;
      _role = null;

      // Redirect to the login screen
      await goToLogin();
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  // Navigate to the login screen (e.g., after logout or token expiry)
  static Future<void> goToLogin() async {
    Get.offAll(() => LoginScreen());
  }

  // Getters for token, userId, and role
  static String? get token => _token;
  static String? get userId => _userId;
  static String? get role => _role;

  // Optional: Convert stored role string back to Role enum
  static Role? get roleAsEnum {
    if (_role == null) return null;
    try {
      return Role.values.firstWhere((e) => e.toString() == _role);
    } catch (e) {
      log('Error parsing role: $e');
      return null;
    }
  }
}
