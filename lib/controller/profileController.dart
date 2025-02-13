import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:chat_app/data/datascore/remote/usersData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../core/class/stasusRecuest.dart';

abstract class ProfileController extends GetxController {
  goToEditProfilepage();
  getMeData();
  cahngeDarkMode();
  shareApp();
  changeNotifications();
}

class ProfileControllerImp extends ProfileController {
  Usersdata usersdata = Usersdata();
  AppService appService = Get.find();
  var dataList = [].obs;
  String? userName;
  String? userImage;
  String? userEmail;
  late Stasusrecuest stasusrecuest;
  final lightTheme = ThemeData.light().obs;
  final darkTheme = ThemeData.dark().obs;
  bool? dark_mode;
  bool? notifications;

  @override
  goToEditProfilepage() {
    Get.toNamed(AppRoutes.updateUerDataPage);
    update();
  }

  @override
  getMeData() {
    stasusrecuest = Stasusrecuest.loading;
    update();
    String user_email = appService.sharedPreferences.getString("user_email") ?? "";
    usersdata.getUser(user_email).listen((querySnapshot) {
      dataList.value = querySnapshot.docs;
      userImage = dataList[0]["image"];
      userName = dataList[0]["name"];
      userEmail = dataList[0]["email"];
      update();
    });
    stasusrecuest = Stasusrecuest.success;
    update();
  }

  @override
  cahngeDarkMode() {
    if (dark_mode == false) {
      dark_mode = true;
    } else {
      dark_mode = false;
    }

    Get.toNamed(AppRoutes.navigationBarPge, preventDuplicates: false);
    appService.sharedPreferences.setBool("dark_mode", dark_mode!);
    update();
  }

  @override
  changeNotifications() async {
    if (notifications == false) {
      notifications = true;
    } else {
      notifications = false;
    }
    appService.sharedPreferences.setBool("notifaction", notifications!);
    update();
  }

  @override
  shareApp() {
    Share.shareUri(Uri(path: "https://www.amazon.com/gp/product/B0DQ9FV5YF"));
  }

  @override
  void onInit() {
    dark_mode = appService.sharedPreferences.getBool("dark_mode") == null
        ? true
        : appService.sharedPreferences.getBool("dark_mode");
    notifications = appService.sharedPreferences.getBool("notifaction") == null
        ? true
        : appService.sharedPreferences.getBool("notifaction");

    getMeData();
    super.onInit();
  }
}
