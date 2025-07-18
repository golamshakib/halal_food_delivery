import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      // Existing translations
      AppText.language: 'Language',
      AppText.continue1: 'Continue',
      AppText.english: 'English',
      AppText.arabic: 'Arabic',
      AppText.french: 'French',
      AppText.discoverOrder: 'Discover & Order Effortlessly',
      AppText.discoverOrderDesc:
          'Explore a wide variety of restaurants and cuisines, all at your fingertips.',
      AppText.trackOrder: 'Track Your Order in Real Time',
      AppText.trackOrderDesc:
          'Know exactly where your food is with live tracking and instant updates.',
      AppText.securePayments: 'Secure & Seamless Payments',
      AppText.securePaymentsDesc:
          'Pay your way with multiple payment options, from credit cards to digital wallets.',
      AppText.logIn: 'Log In',
      AppText.registration: 'Register',
      AppText.next: 'Next',
      AppText.chooseRole: 'Choose Your Role',
      AppText.chooseRoleDesc:
          'Select a role to tailor your experience and get the most out of the app.',
      AppText.customer: 'Customer',
      AppText.restaurantOwner: 'Restaurant Owner',
      AppText.deliveryPartner: 'Delivery Partner',
      AppText.roleSelection: 'Role Selection',
      AppText.selectRolePrompt: 'Please select a role before proceeding.',
      AppText.error: 'Error',
      AppText.success: 'Success',
      AppText.emailRequired: 'Email is required.',
      AppText.invalidEmailAddress: 'Invalid email address.',
      AppText.passwordRequired: 'Password is required.',
      AppText.passwordMinLength: 'Password must be at least 6 characters long.',
      AppText.passwordUppercase:
          'Password must contain at least one uppercase letter.',
      AppText.passwordNumber: 'Password must contain at least one number.',
      AppText.passwordSpecialChar:
          'Password must contain at least one special character.',
      AppText.phoneNumberRequired: 'Phone number is required.',
      AppText.invalidPhoneNumber: 'Invalid phone number. Must be 11 digits.',
      AppText.passwordsDoNotMatch: 'Passwords do not match.',
      AppText.nameRequired: 'Name is required.',
      AppText.nameMinLength: 'Name must be at least 2 characters long.',
      AppText.usernameRequired: 'Username is required.',
      AppText.invalidUsername:
          'Invalid username. Must be at least 3 characters long.',
      AppText.confirmPasswordRequired: 'Confirm password is required.',
      AppText.fieldRequired: 'This field is required.',
      AppText.addressRequired: 'Address is required.',
      AppText.addressMinLength: 'Address must be at least 10 characters long.',
      AppText.zipCodeRequired: 'Zip code is required.',
      AppText.invalidZipCode: 'Invalid zip code. Must be 5 digits.',

      // New translations from SignUpScreen
      AppText.createAccount: 'Create an account',
      AppText.exploreDescription:
          'Start exploring a world of delicious meals, real-time tracking, and seamless deliveries!',
      AppText.typeYourEmail: 'Type Your Email',
      AppText.typeYourName: 'Type Your Name',
      AppText.typeYourLocation: 'Type Your Location',
      AppText.typeYourPassword: 'Type Your Password',
      AppText.commercialLicense: 'Commercial license/AVS Certificate',
      AppText.signatureHere: 'Signature Here',
      AppText.signUp: 'Sign Up',
      AppText.alreadyHaveAccount: 'Already have an account?',
      AppText.signIn: 'Sign In',

      // New translations from SingUpController
      AppText.locationServicesDisabled: 'Location services are disabled',
      AppText.locationPermissionDenied: 'Location permission denied',
      AppText.locationPermissionPermanentlyDenied:
          'Location permission permanently denied',
      AppText.errorGettingLocation: 'Error getting location: %s',
      AppText.emailCannotBeEmpty: 'Email cannot be empty',
      AppText.nameCannotBeEmpty: 'Name cannot be empty',
      AppText.locationCannotBeEmpty: 'Location cannot be empty',
      AppText.passwordCannotBeEmpty: 'Password cannot be empty',
      AppText.uploadRestaurantDocuments: 'Please upload restaurant documents',
      AppText.selectLocation: 'Please select a location',
      AppText.errorFetchingAddress: 'Error fetching address: %s',
      AppText.signUpSuccessful: 'Sign up successful',
      AppText.userAlreadyExists: 'User already exists',
      AppText.failedToSignUp: 'Failed to sign up: %s',
      AppText.errorSigningUp: 'Error signing up: %s',
      AppText.locationRequired: 'Location is required',
      AppText.locationMinLength: 'Location must be at least 5 characters long',

      // New translations from CreatePasswordScreen
      AppText.setNewPassword: 'Set New Password',
      AppText.createNewPasswordDesc:
          'Create your new password so you can share your memories again.',
      AppText.newPassword: 'New password',
      AppText.confirmPassword: 'Confirm password',
      AppText.changePassword: 'Change Password',

      // New translations from ForgetPasswordScreen
      AppText.resetPassword: 'Reset password',
      AppText.resetPasswordDesc:
          'Please enter your email to reset the password',
      AppText.otpSentSuccessfully: 'OTP sent successfully to %s',
      AppText.emailNotRegistered: 'Email is not registered.',
      AppText.errorSendingOtp:
          'Error occurred while sending OTP. Please try again.',

      // New translations from LoginScreen
      AppText.welcomeBack: 'Welcome Back 👋',
      AppText.welcomeBackDesc:
          'We happy to see you again! To use your account, please sign in first.',
      AppText.forgotPassword: 'Forgot password?',
      AppText.dontHaveAccount: 'I don’t have an account?',
      AppText.pleaseFillAllFields: 'Please fill in all fields',
      AppText.invalidLoginResponse: 'Invalid login response',
      AppText.invalidRoleReceived: 'Invalid role received from server',
      AppText.errorLoggingIn:
          'Error occurred while logging in. Please try again.',

      // New translations from SuccessfulScreen
      AppText.passwordChangedSuccessfully:
          'Congratulation! your password has been changed successfully!',

      // New translations from VerificationSuccessfulScreen
      AppText.verificationSuccessful: 'Verification Successful!',
      AppText.verificationSuccessfulDesc:
          'You have successfully verified your email address',

      // New translations from VerifyScreen
      AppText.verificationCode: 'Verification code',
      AppText.verificationCodeDesc:
          'Please check your phone. We have sent the verification code to your email.',
      AppText.verify: 'Verify',
      AppText.otpIncorrect: 'OTP is incorrect',
      AppText.otpExpired: 'OTP is expired',
      AppText.errorVerifyingOtp: 'An error occurred while verifying OTP',
      AppText.otpResentSuccessfully: 'OTP resent successfully',
      AppText.failedToResendOtp: 'Failed to resend OTP',
      AppText.errorResendingOtp: 'An error occurred while resending OTP',

      // New translations from VerifyBox
      AppText.resendCodeIn: 'Resend code in ',
      AppText.resend: 'Resend',

      AppText.loginSuccesful: 'Login Successful',
      AppText.passwordIncorrted: 'Password is Incorrected',
      AppText.userNotExist: "User not Exist",

      /// change Password
      AppText.oldAndNewPasswordSame:
          'Your old and new password are the same. Change password',
      AppText.passwordUpdatedSuccess: 'Password updated successfully',
      AppText.failedToUpdatePassword: 'Failed to update password',
      AppText.errorChangingPassword:
          'An error occurred while changing password',
      AppText.incorrectCurrentPassword: 'Incorrect current password',
    },
    'fr_FR': {
      // Existing translations
      AppText.language: 'Langue',
      AppText.continue1: 'Continuer',
      AppText.english: 'Anglais',
      AppText.arabic: 'Arabe',
      AppText.french: 'Français',
      AppText.discoverOrder: 'Découvrir et Commander Facilement',
      AppText.discoverOrderDesc:
          'Explorez une grande variété de restaurants et de cuisines, à portée de main.',
      AppText.trackOrder: 'Suivez Votre Commande en Temps Réel',
      AppText.trackOrderDesc:
          'Sachez exactement où se trouve votre nourriture grâce au suivi en direct et aux mises à jour instantanées.',
      AppText.securePayments: 'Paiements Sécurisés et Fluides',
      AppText.securePaymentsDesc:
          'Payez à votre manière avec plusieurs options de paiement, des cartes de crédit aux portefeuilles numériques.',
      AppText.logIn: 'Se Connecter',
      AppText.registration: 'S\'Inscrire',
      AppText.next: 'Suivant',
      AppText.chooseRole: 'Choisissez Votre Rôle',
      AppText.chooseRoleDesc:
          'Sélectionnez un rôle pour personnaliser votre expérience et tirer le meilleur parti de l\'application.',
      AppText.customer: 'Client',
      AppText.restaurantOwner: 'Propriétaire de Restaurant',
      AppText.deliveryPartner: 'Partenaire de Livraison',
      AppText.roleSelection: 'Sélection du Rôle',
      AppText.selectRolePrompt:
          'Veuillez sélectionner un rôle avant de continuer.',
      AppText.error: 'Erreur',
      AppText.success: 'Succès',
      AppText.emailRequired: 'L\'email est requis.',
      AppText.invalidEmailAddress: 'Adresse email invalide.',
      AppText.passwordRequired: 'Le mot de passe est requis.',
      AppText.passwordMinLength:
          'Le mot de passe doit comporter au moins 6 caractères.',
      AppText.passwordUppercase:
          'Le mot de passe doit contenir au moins une lettre majuscule.',
      AppText.passwordNumber:
          'Le mot de passe doit contenir au moins un chiffre.',
      AppText.passwordSpecialChar:
          'Le mot de passe doit contenir au moins un caractère spécial.',
      AppText.phoneNumberRequired: 'Le numéro de téléphone est requis.',
      AppText.invalidPhoneNumber:
          'Numéro de téléphone invalide. Doit comporter 11 chiffres.',
      AppText.passwordsDoNotMatch: 'Les mots de passe ne correspondent pas.',
      AppText.nameRequired: 'Le nom est requis.',
      AppText.nameMinLength: 'Le nom doit comporter au moins 2 caractères.',
      AppText.usernameRequired: 'Le nom d\'utilisateur est requis.',
      AppText.invalidUsername:
          'Nom d\'utilisateur invalide. Doit comporter au moins 3 caractères.',
      AppText.confirmPasswordRequired:
          'La confirmation du mot de passe est requise.',
      AppText.fieldRequired: 'Ce champ est requis.',
      AppText.addressRequired: 'L\'adresse est requise.',
      AppText.addressMinLength:
          'L\'adresse doit comporter au moins 10 caractères.',
      AppText.zipCodeRequired: 'Le code postal est requis.',
      AppText.invalidZipCode:
          'Code postal invalide. Doit comporter 5 chiffres.',

      // New translations from SignUpScreen
      AppText.createAccount: 'Créer un compte',
      AppText.exploreDescription:
          'Commencez à explorer un monde de repas délicieux, de suivi en temps réel et de livraisons fluides !',
      AppText.typeYourEmail: 'Entrez votre email',
      AppText.typeYourName: 'Entrez votre nom',
      AppText.typeYourLocation: 'Entrez votre localisation',
      AppText.typeYourPassword: 'Entrez votre mot de passe',
      AppText.commercialLicense: 'Licence commerciale/Certificat AVS',
      AppText.signatureHere: 'Signature ici',
      AppText.signUp: 'S\'inscrire',
      AppText.alreadyHaveAccount: 'Vous avez déjà un compte ?',
      AppText.signIn: 'Se connecter',

      // New translations from SingUpController
      AppText.locationServicesDisabled:
          'Les services de localisation sont désactivés',
      AppText.locationPermissionDenied: 'Permission de localisation refusée',
      AppText.locationPermissionPermanentlyDenied:
          'Permission de localisation refusée de manière permanente',
      AppText.errorGettingLocation:
          'Erreur lors de l\'obtention de la localisation : %s',
      AppText.emailCannotBeEmpty: 'L\'email ne peut pas être vide',
      AppText.nameCannotBeEmpty: 'Le nom ne peut pas être vide',
      AppText.locationCannotBeEmpty: 'La localisation ne peut pas être vide',
      AppText.passwordCannotBeEmpty: 'Le mot de passe ne peut pas être vide',
      AppText.uploadRestaurantDocuments:
          'Veuillez télécharger les documents du restaurant',
      AppText.selectLocation: 'Veuillez sélectionner une localisation',
      AppText.errorFetchingAddress:
          'Erreur lors de la récupération de l\'adresse : %s',
      AppText.signUpSuccessful: 'Inscription réussie',
      AppText.userAlreadyExists: 'L\'utilisateur existe déjà',
      AppText.failedToSignUp: 'Échec de l\'inscription : %s',
      AppText.errorSigningUp: 'Erreur lors de l\'inscription : %s',
      AppText.locationRequired: 'La localisation est requise',
      AppText.locationMinLength:
          'La localisation doit comporter au moins 5 caractères',

      // New translations from CreatePasswordScreen
      AppText.setNewPassword: 'Définir un nouveau mot de passe',
      AppText.createNewPasswordDesc:
          'Créez votre nouveau mot de passe pour pouvoir partager à nouveau vos souvenirs.',
      AppText.newPassword: 'Nouveau mot de passe',
      AppText.confirmPassword: 'Confirmer le mot de passe',
      AppText.changePassword: 'Changer le mot de passe',

      // New translations from ForgetPasswordScreen
      AppText.resetPassword: 'Réinitialiser le mot de passe',
      AppText.resetPasswordDesc:
          'Veuillez entrer votre email pour réinitialiser le mot de passe',
      AppText.otpSentSuccessfully: 'OTP envoyé avec succès à %s',
      AppText.emailNotRegistered: 'L\'email n\'est pas enregistré.',
      AppText.errorSendingOtp:
          'Une erreur s\'est produite lors de l\'envoi de l\'OTP. Veuillez réessayer.',

      // New translations from LoginScreen
      AppText.welcomeBack: 'Bon retour 👋',
      AppText.welcomeBackDesc:
          'Nous sommes heureux de vous revoir ! Pour utiliser votre compte, veuillez d\'abord vous connecter.',
      AppText.forgotPassword: 'Mot de passe oublié ?',
      AppText.dontHaveAccount: 'Je n\'ai pas de compte ?',
      AppText.pleaseFillAllFields: 'Veuillez remplir tous les champs',
      AppText.invalidLoginResponse: 'Réponse de connexion invalide',
      AppText.invalidRoleReceived: 'Rôle invalide reçu du serveur',
      AppText.errorLoggingIn:
          'Une erreur s\'est produite lors de la connexion. Veuillez réessayer.',

      // New translations from SuccessfulScreen
      AppText.passwordChangedSuccessfully:
          'Félicitations ! Votre mot de passe a été changé avec succès !',

      // New translations from VerificationSuccessfulScreen
      AppText.verificationSuccessful: 'Vérification réussie !',
      AppText.verificationSuccessfulDesc:
          'Vous avez vérifié votre adresse email avec succès',

      // New translations from VerifyScreen
      AppText.verificationCode: 'Code de vérification',
      AppText.verificationCodeDesc:
          'Veuillez vérifier votre téléphone. Nous avons envoyé le code de vérification à votre email.',
      AppText.verify: 'Vérifier',
      AppText.otpIncorrect: 'L\'OTP est incorrect',
      AppText.otpExpired: 'L\'OTP a expiré',
      AppText.errorVerifyingOtp:
          'Une erreur s\'est produite lors de la vérification de l\'OTP',
      AppText.otpResentSuccessfully: 'OTP renvoyé avec succès',
      AppText.failedToResendOtp: 'Échec du renvoi de l\'OTP',
      AppText.errorResendingOtp:
          'Une erreur s\'est produite lors du renvoi de l\'OTP',

      // New translations from VerifyBox
      AppText.resendCodeIn: 'Renvoyer le code dans ',
      AppText.resend: 'Renvoyer',

      AppText.loginSuccesful: 'Connexion réussie',
      AppText.passwordIncorrted: 'Le mot de passe est incorrect',

      AppText.userNotExist: "L'utilisateur n'existe pas",

      /// change Password
      AppText.oldAndNewPasswordSame:
          "Votre ancien et nouveau mot de passe sont identiques. Changez le mot de passe.",
      AppText.passwordUpdatedSuccess: "Mot de passe mis à jour avec succès.",
      AppText.failedToUpdatePassword:
          "Échec de la mise à jour du mot de passe.",
      AppText.errorChangingPassword:
          "Une erreur s'est produite lors du changement de mot de passe.",
      AppText.incorrectCurrentPassword: "Mot de passe actuel incorrect.",
    },
    'ar_AR': {
      // Existing translations
      AppText.language: 'اللغة',
      AppText.continue1: 'متابعة',
      AppText.english: 'الإنجليزية',
      AppText.arabic: 'العربية',
      AppText.french: 'الفرنسية',
      AppText.discoverOrder: 'اكتشف واطلب بسهولة',
      AppText.discoverOrderDesc:
          'استكشف مجموعة واسعة من المطاعم والمأكولات، كل ذلك في متناول يدك.',
      AppText.trackOrder: 'تتبع طلبك في الوقت الفعلي',
      AppText.trackOrderDesc:
          'اعرف بالضبط مكان طعامك مع التتبع المباشر والتحديثات الفورية.',
      AppText.securePayments: 'مدفوعات آمنة وسلسة',
      AppText.securePaymentsDesc:
          'ادفع بطريقتك مع خيارات دفع متعددة، من بطاقات الائتمان إلى المحافظ الرقمية.',
      AppText.logIn: 'تسجيل الدخول',
      AppText.registration: 'التسجيل',
      AppText.next: 'التالي',
      AppText.chooseRole: 'اختر دورك',
      AppText.chooseRoleDesc:
          'حدد دورًا لتخصيص تجربتك والحصول على أقصى استفادة من التطبيق.',
      AppText.customer: 'عميل',
      AppText.restaurantOwner: 'صاحب مطعم',
      AppText.deliveryPartner: 'شريك التوصيل',
      AppText.roleSelection: 'اختيار الدور',
      AppText.selectRolePrompt: 'يرجى اختيار دور قبل المتابعة.',
      AppText.error: 'خطأ',
      AppText.success: 'نجاح',
      AppText.emailRequired: 'البريد الإلكتروني مطلوب.',
      AppText.invalidEmailAddress: 'عنوان البريد الإلكتروني غير صالح.',
      AppText.passwordRequired: 'كلمة المرور مطلوبة.',
      AppText.passwordMinLength:
          'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل.',
      AppText.passwordUppercase:
          'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل.',
      AppText.passwordNumber:
          'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل.',
      AppText.passwordSpecialChar:
          'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل.',
      AppText.phoneNumberRequired: 'رقم الهاتف مطلوب.',
      AppText.invalidPhoneNumber:
          'رقم الهاتف غير صالح. يجب أن يتكون من 11 رقمًا.',
      AppText.passwordsDoNotMatch: 'كلمات المرور غير متطابقة.',
      AppText.nameRequired: 'الاسم مطلوب.',
      AppText.nameMinLength: 'يجب أن يتكون الاسم من 2 حرف على الأقل.',
      AppText.usernameRequired: 'اسم المستخدم مطلوب.',
      AppText.invalidUsername:
          'اسم المستخدم غير صالح. يجب أن يتكون من 3 أحرف على الأقل.',
      AppText.confirmPasswordRequired: 'تأكيد كلمة المرور مطلوب.',
      AppText.fieldRequired: 'هذا الحقل مطلوب.',
      AppText.addressRequired: 'العنوان مطلوب.',
      AppText.addressMinLength: 'يجب أن يتكون العنوان من 10 أحرف على الأقل.',
      AppText.zipCodeRequired: 'الرمز البريدي مطلوب.',
      AppText.invalidZipCode:
          'الرمز البريدي غير صالح. يجب أن يتكون من 5 أرقام.',

      // New translations from SignUpScreen
      AppText.createAccount: 'إنشاء حساب',
      AppText.exploreDescription:
          'ابدأ في استكشاف عالم من الوجبات اللذيذة، التتبع في الوقت الفعلي، والتوصيلات السلسة!',
      AppText.typeYourEmail: 'اكتب بريدك الإلكتروني',
      AppText.typeYourName: 'اكتب اسمك',
      AppText.typeYourLocation: 'اكتب موقعك',
      AppText.typeYourPassword: 'اكتب كلمة المرور الخاصة بك',
      AppText.commercialLicense: 'الرخصة التجارية/شهادة AVS',
      AppText.signatureHere: 'التوقيع هنا',
      AppText.signUp: 'التسجيل',
      AppText.alreadyHaveAccount: 'هل لديك حساب بالفعل؟',
      AppText.signIn: 'تسجيل الدخول',

      // New translations from SingUpController
      AppText.locationServicesDisabled: 'خدمات الموقع معطلة',
      AppText.locationPermissionDenied: 'تم رفض إذن الموقع',
      AppText.locationPermissionPermanentlyDenied:
          'تم رفض إذن الموقع بشكل دائم',
      AppText.errorGettingLocation: 'خطأ في الحصول على الموقع: %s',
      AppText.emailCannotBeEmpty: 'البريد الإلكتروني لا يمكن أن يكون فارغًا',
      AppText.nameCannotBeEmpty: 'الاسم لا يمكن أن يكون فارغًا',
      AppText.locationCannotBeEmpty: 'الموقع لا يمكن أن يكون فارغًا',
      AppText.passwordCannotBeEmpty: 'كلمة المرور لا يمكن أن تكون فارغة',
      AppText.uploadRestaurantDocuments: 'يرجى رفع وثائق المطعم',
      AppText.selectLocation: 'يرجى اختيار موقع',
      AppText.errorFetchingAddress: 'خطأ في جلب العنوان: %s',
      AppText.signUpSuccessful: 'التسجيل ناجح',
      AppText.userAlreadyExists: 'المستخدم موجود بالفعل',
      AppText.failedToSignUp: 'فشل التسجيل: %s',
      AppText.errorSigningUp: 'خطأ أثناء التسجيل: %s',
      AppText.locationRequired: 'الموقع مطلوب',
      AppText.locationMinLength: 'يجب أن يتكون الموقع من 5 أحرف على الأقل',

      // New translations from CreatePasswordScreen
      AppText.setNewPassword: 'تعيين كلمة مرور جديدة',
      AppText.createNewPasswordDesc:
          'قم بإنشاء كلمة المرور الجديدة الخاصة بك حتى تتمكن من مشاركة ذكرياتك مرة أخرى.',
      AppText.newPassword: 'كلمة المرور الجديدة',
      AppText.confirmPassword: 'تأكيد كلمة المرور',
      AppText.changePassword: 'تغيير كلمة المرور',

      // New translations from ForgetPasswordScreen
      AppText.resetPassword: 'إعادة تعيين كلمة المرور',
      AppText.resetPasswordDesc:
          'يرجى إدخال بريدك الإلكتروني لإعادة تعيين كلمة المرور',
      AppText.otpSentSuccessfully: 'تم إرسال OTP بنجاح إلى %s',
      AppText.emailNotRegistered: 'البريد الإلكتروني غير مسجل.',
      AppText.errorSendingOtp:
          'حدث خطأ أثناء إرسال OTP. يرجى المحاولة مرة أخرى.',

      // New translations from LoginScreen
      AppText.welcomeBack: 'مرحبًا بعودتك 👋',
      AppText.welcomeBackDesc:
          'نحن سعداء برؤيتك مرة أخرى! لاستخدام حسابك، يرجى تسجيل الدخول أولاً.',
      AppText.forgotPassword: 'هل نسيت كلمة المرور؟',
      AppText.dontHaveAccount: 'ليس لدي حساب؟',
      AppText.pleaseFillAllFields: 'يرجى ملء جميع الحقول',
      AppText.invalidLoginResponse: 'استجابة تسجيل الدخول غير صالحة',
      AppText.invalidRoleReceived: 'تم استلام دور غير صالح من الخادم',
      AppText.errorLoggingIn:
          'حدث خطأ أثناء تسجيل الدخول. يرجى المحاولة مرة أخرى.',

      // New translations from SuccessfulScreen
      AppText.passwordChangedSuccessfully:
          'تهانينا! تم تغيير كلمة المرور بنجاح!',

      // New translations from VerificationSuccessfulScreen
      AppText.verificationSuccessful: 'تم التحقق بنجاح!',
      AppText.verificationSuccessfulDesc:
          'لقد قمت بالتحقق من عنوان بريدك الإلكتروني بنجاح',

      // New translations from VerifyScreen
      AppText.verificationCode: 'رمز التحقق',
      AppText.verificationCodeDesc:
          'يرجى التحقق من هاتفك. لقد أرسلنا رمز التحقق إلى بريدك الإلكتروني.',
      AppText.verify: 'تحقق',
      AppText.otpIncorrect: 'OTP غير صحيح',
      AppText.otpExpired: 'OTP منتهي الصلاحية',
      AppText.errorVerifyingOtp: 'حدث خطأ أثناء التحقق من OTP',
      AppText.otpResentSuccessfully: 'تم إعادة إرسال OTP بنجاح',
      AppText.failedToResendOtp: 'فشل إعادة إرسال OTP',
      AppText.errorResendingOtp: 'حدث خطأ أثناء إعادة إرسال OTP',

      // New translations from VerifyBox
      AppText.resendCodeIn: 'إعادة إرسال الرمز في ',
      AppText.resend: 'إعادة إرسال',
      AppText.loginSuccesful: 'تم تسجيل الدخول بنجاح',
      AppText.passwordIncorrted: 'كلمة المرور غير صحيحة',
      AppText.userNotExist: "المستخدم غير موجود",

      /// change Password
      AppText.oldAndNewPasswordSame:
          "كلمتي المرور القديمة والجديدة متطابقتان. قم بتغيير كلمة المرور",
      AppText.passwordUpdatedSuccess: "تم تحديث كلمة المرور بنجاح",
      AppText.failedToUpdatePassword: "فشل في تحديث كلمة المرور",
      AppText.errorChangingPassword: "حدث خطأ أثناء تغيير كلمة المرور",
      AppText.incorrectCurrentPassword: "كلمة المرور الحالية غير صحيحة",
    },
  };
}
