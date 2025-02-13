import 'package:chat_app/controller/profileController.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppService appService = Get.find();

ProfileControllerImp p_controller = Get.put(ProfileControllerImp());

class AppColor {
  static Color bg_brand_solid =
      Color(appService.sharedPreferences.getDouble("style")!.toInt());
  static Color get bg_brand_soli => bg_brand_solid;
  static set bg_brand_soli(Color color) {
    bg_brand_solid = color;
  }

  static Color get bg_tertiarty =>
     p_controller.dark_mode == true ? const Color(0xFF1E1E1E) : const Color(0xffff2f4f7);

  static Color get bg_diabled =>
  p_controller.dark_mode == true? const Color(0xFF2D2D2D) : const Color(0xffff2f4f7);

  // Border
  static Color get border_primary =>
 p_controller.dark_mode == true ? const Color(0xFF444444) : const Color(0xFFD0D5DD);

  static Color get border_error =>
      p_controller.dark_mode == true ? const Color(0xFFEB5757) : const Color(0xFFFDA29B);

  static Color get border_secondary =>
    p_controller.dark_mode == true ? const Color(0xFF555555) : const Color(0xfff9096a4);

  static Color get border_profile =>
    p_controller.dark_mode == true ? const Color(0xFF555555) : const Color(0xfff9096a4);

  static Color get border_disabled =>
      p_controller.dark_mode == true ? const Color(0xFF444444) : const Color(0xfffd0d5dd);

  // Text
  static Color get text_disabled =>
 p_controller.dark_mode == true? const Color(0xFF777777) : const Color(0xfff667085);

  static Color get text_quarterary =>
    p_controller.dark_mode == true? const Color(0xFF777777) : const Color(0xfff667085);

  static Color get text_foreground =>
     p_controller.dark_mode == true? const Color(0xFFFFFFFF) : const Color(0xfff98a2b3);

  static Color get text_placeholder_subtle =>
    p_controller.dark_mode == true? const Color(0xFF888888) : const Color(0xFFD0D5DD);

  static Color get text_secondary =>
      p_controller.dark_mode == true ? const Color(0xFFCCCCCC) : const Color(0xfff344054);

  // Background
  static Color get background =>
      p_controller.dark_mode == true ? const Color(0xFF121212) : Colors.white;
}
