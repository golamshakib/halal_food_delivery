import 'package:get/get.dart';
import 'package:halal_food_delivery/core/utils/constants/app_texts.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
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
      AppText.register: 'Register',
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
    },
    'fr_FR': {
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
      AppText.register: 'S\'Inscrire',
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
    },
    'ar_AR': {
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
      AppText.register: 'التسجيل',
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
    },
  };
}
