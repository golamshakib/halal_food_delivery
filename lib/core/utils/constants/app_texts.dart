class AppText {
  AppText._();

  /// Existing keys
  static const String language = 'language';
  static const String continue1 = 'continue1';
  static const String english = 'english';
  static const String arabic = 'arabic';
  static const String french = 'french';
  static const String discoverOrder = 'discoverOrder';
  static const String discoverOrderDesc = 'discoverOrderDesc';
  static const String trackOrder = 'trackOrder';
  static const String trackOrderDesc = 'trackOrderDesc';
  static const String securePayments = 'securePayments';
  static const String securePaymentsDesc = 'securePaymentsDesc';
  static const String logIn = 'logIn';
  static const String registration = 'registration';
  static const String next = 'next';
  static const String chooseRole = 'chooseRole';
  static const String chooseRoleDesc = 'chooseRoleDesc';
  static const String customer = 'customer';
  static const String restaurantOwner = 'restaurantOwner';
  static const String deliveryPartner = 'deliveryPartner';
  static const String roleSelection = 'roleSelection';
  static const String selectRolePrompt = 'selectRolePrompt';
  static const String error = 'error';
  static const String success = 'success';

  static const String emailRequired = 'emailRequired';
  static const String invalidEmailAddress = 'invalidEmailAddress';
  static const String passwordRequired = 'passwordRequired';
  static const String passwordMinLength = 'passwordMinLength';
  static const String passwordUppercase = 'passwordUppercase';
  static const String passwordNumber = 'passwordNumber';
  static const String passwordSpecialChar = 'passwordSpecialChar';
  static const String phoneNumberRequired = 'phoneNumberRequired';
  static const String invalidPhoneNumber = 'invalidPhoneNumber';
  static const String passwordsDoNotMatch = 'passwordsDoNotMatch';
  static const String nameRequired = 'nameRequired';
  static const String nameMinLength = 'nameMinLength';
  static const String usernameRequired = 'usernameRequired';
  static const String invalidUsername = 'invalidUsername';
  static const String confirmPasswordRequired = 'confirmPasswordRequired';
  static const String fieldRequired = 'fieldRequired';
  static const String addressRequired = 'addressRequired';
  static const String addressMinLength = 'addressMinLength';
  static const String zipCodeRequired = 'zipCodeRequired';
  static const String invalidZipCode = 'invalidZipCode';

  /// New keys from SignUpScreen
  static const String createAccount = 'createAccount';
  static const String exploreDescription = 'exploreDescription';
  static const String typeYourEmail = 'typeYourEmail';
  static const String typeYourName = 'typeYourName';
  static const String typeYourLocation = 'typeYourLocation';
  static const String typeYourPassword = 'typeYourPassword';
  static const String commercialLicense = 'commercialLicense';
  static const String signatureHere = 'signatureHere';
  static const String signUp = 'signUp';
  static const String alreadyHaveAccount = 'alreadyHaveAccount';
  static const String signIn = 'signIn';

  /// New keys from SingUpController
  static const String locationServicesDisabled = 'locationServicesDisabled';
  static const String locationPermissionDenied = 'locationPermissionDenied';
  static const String locationPermissionPermanentlyDenied =
      'locationPermissionPermanentlyDenied';
  static const String errorGettingLocation = 'errorGettingLocation';
  static const String emailCannotBeEmpty = 'emailCannotBeEmpty';
  static const String nameCannotBeEmpty = 'nameCannotBeEmpty';
  static const String locationCannotBeEmpty = 'locationCannotBeEmpty';
  static const String passwordCannotBeEmpty = 'passwordCannotBeEmpty';
  static const String uploadRestaurantDocuments = 'uploadRestaurantDocuments';
  static const String selectLocation = 'selectLocation';
  static const String errorFetchingAddress = 'errorFetchingAddress';
  static const String signUpSuccessful = 'signUpSuccessful';
  static const String userAlreadyExists = 'userAlreadyExists';
  static const String failedToSignUp = 'failedToSignUp';
  static const String errorSigningUp = 'errorSigningUp';
  static const String locationRequired = 'locationRequired';
  static const String locationMinLength = 'locationMinLength';

  /// New keys from CreatePasswordScreen
  static const String setNewPassword = 'setNewPassword';
  static const String createNewPasswordDesc = 'createNewPasswordDesc';
  static const String newPassword = 'newPassword';
  static const String confirmPassword = 'confirmPassword';
  static const String changePassword = 'changePassword';

  /// New keys from ForgetPasswordScreen
  static const String resetPassword = 'resetPassword';
  static const String resetPasswordDesc = 'resetPasswordDesc';
  static const String otpSentSuccessfully = 'otpSentSuccessfully';
  static const String emailNotRegistered = 'emailNotRegistered';
  static const String errorSendingOtp = 'errorSendingOtp';

  /// New keys from LoginScreen
  static const String welcomeBack = 'welcomeBack';
  static const String welcomeBackDesc = 'welcomeBackDesc';
  static const String forgotPassword = 'forgotPassword';
  static const String dontHaveAccount = 'dontHaveAccount';
  static const String pleaseFillAllFields = 'pleaseFillAllFields';
  static const String invalidLoginResponse = 'invalidLoginResponse';
  static const String invalidRoleReceived = 'invalidRoleReceived';
  static const String errorLoggingIn = 'errorLoggingIn';

  /// New keys from SuccessfulScreen
  static const String passwordChangedSuccessfully =
      'passwordChangedSuccessfully';

  /// New keys from VerificationSuccessfulScreen
  static const String verificationSuccessful = 'verificationSuccessful';
  static const String verificationSuccessfulDesc = 'verificationSuccessfulDesc';

  /// New keys from VerifyScreen
  static const String verificationCode = 'verificationCode';
  static const String verificationCodeDesc = 'verificationCodeDesc';
  static const String verify = 'verify';
  static const String otpIncorrect = 'otpIncorrect';
  static const String otpExpired = 'otpExpired';
  static const String errorVerifyingOtp = 'errorVerifyingOtp';
  static const String otpResentSuccessfully = 'otpResentSuccessfully';
  static const String failedToResendOtp = 'failedToResendOtp';
  static const String errorResendingOtp = 'errorResendingOtp';

  /// New keys from VerifyBox
  static const String resendCodeIn = 'resendCodeIn';
  static const String resend = 'resend';
}
