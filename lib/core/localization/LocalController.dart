import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Localcontroller extends GetxController {
  AppService appService = Get.find();
  Locale? language;
  String? localcode;
  int lang_index = 0;
  changeLang(String languageCode, int index) {
    lang_index = index;
    appService.sharedPreferences.setString("lang", languageCode);
    Locale locale = Locale(languageCode);
    Get.updateLocale(locale);
    Get.offAllNamed(AppRoutes.navigationBarPge);
    update();
  }

  void loadLang() {
    language = Locale(appService.sharedPreferences.getString("lang") ??
        Get.deviceLocale!.languageCode);
  }

  @override
  void onInit() {
    loadLang();
    super.onInit();
  }
}
