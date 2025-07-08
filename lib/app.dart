import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'core/bindings/controller_binder.dart';
import 'core/utils/constants/app_sizer.dart';
import 'core/utils/constants/app_translations.dart';
import 'core/utils/theme/theme.dart';
import 'features/language/controllers/lanauage_controller.dart';
import 'routes/app_routes.dart';

class PlatformUtils {
  static bool get isIOS =>
      foundation.defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isAndroid =>
      foundation.defaultTargetPlatform == TargetPlatform.android;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure LanguageController is initialized
    Get.put(LanguageController());

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Obx(() {
          // Access LanguageController after initialization
          final languageController = Get.find<LanguageController>();
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoute.init,
            getPages: AppRoute.routes,
            initialBinding: ControllerBinder(),
            themeMode: ThemeMode.system,
            theme: _getLightTheme(),
            darkTheme: _getDarkTheme(),
            defaultTransition:
                PlatformUtils.isIOS ? Transition.cupertino : Transition.fade,
            locale: languageController.currentLocale.value,
            translations: AppTranslations(),
            builder:
                (context, child) =>
                    PlatformUtils.isIOS
                        ? CupertinoTheme(
                          data: const CupertinoThemeData(),
                          child: child!,
                        )
                        : child!,
          );
        });
      },
    );
  }

  ThemeData _getLightTheme() {
    return PlatformUtils.isIOS
        ? AppTheme.lightTheme.copyWith(platform: TargetPlatform.iOS)
        : AppTheme.lightTheme;
  }

  ThemeData _getDarkTheme() {
    return PlatformUtils.isIOS
        ? AppTheme.darkTheme.copyWith(platform: TargetPlatform.iOS)
        : AppTheme.darkTheme;
  }
}
