class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'http://10.0.20.64:7012/api/v1';

  /// Auth
  static const String login = '$_baseUrl/auth/login';
  static const String verifyOtp = '$_baseUrl/auth/verify-otp';
  static const String resendOtp = '$_baseUrl/auth/resend-otp';
  static const String forgetPassword = '$_baseUrl/auth/forget-password';
  static const String resetPassword = '$_baseUrl/auth/reset-password';

  /// user
  static const String create = '$_baseUrl/user/create';
  static const String changePassword = '$_baseUrl/user/change-password';
  static const String user = '$_baseUrl/user/me';
  static const String addMenu = '$_baseUrl/food/create';
  static const String food = '$_baseUrl/food';
}
