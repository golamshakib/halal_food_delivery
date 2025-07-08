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
    },
  };
}
