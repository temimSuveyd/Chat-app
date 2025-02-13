import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:chat_app/data/models/profileModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

AppService appService = Get.find();

List<ProfileModel> profileData = [
  ProfileModel("Language".tr, Icons.language, () {
    Get.toNamed(AppRoutes.languagePage);
  }),
  ProfileModel("Mode".tr, Icons.style, () {
    Get.toNamed(AppRoutes.appStylesPage);
  }),
  ProfileModel("Forgot_Password".tr, Icons.password_rounded, () {
    Get.toNamed(AppRoutes.forgetPasswordPage);
  }),
  ProfileModel("Logout".tr, Icons.exit_to_app_outlined, () {
    appService.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.sigInPage);
  }),
];
