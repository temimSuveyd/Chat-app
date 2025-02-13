import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleware extends GetMiddleware {
  AppService appService = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (appService.sharedPreferences.getBool("sig_in") == true) {
      return const RouteSettings(name: AppRoutes.navigationBarPge);
    } else {
      return const RouteSettings(name: AppRoutes.onBoardingPage);
    }
  }
}
