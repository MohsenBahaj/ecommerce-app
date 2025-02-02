import 'package:ecomm/features/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPrefrence.setString('lang', langcode);

    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? langCode = myServices.sharedPrefrence.getString('lang');
    if (langCode == "ar") {
      language = const Locale('ar');
    } else if (langCode == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
