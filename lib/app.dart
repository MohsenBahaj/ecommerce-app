import 'package:ecomm/bindings/general_bindings.dart';
import 'package:ecomm/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecomm/localization/changelocal.dart';
import 'package:ecomm/localization/translation.dart';
import 'package:ecomm/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
