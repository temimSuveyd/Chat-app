import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/view/pages/home.dart';
import 'package:chat_app/view/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NavigationBarController extends GetxController {
  changePage(int index);
  styleinit();
}

class NavigationBarControllerImp extends NavigationBarController {
  int currentPage = 0;
  List iconsList = [
    {
      "icon": Icons.chat_rounded,
      "text": "Chats".tr,
    },
    {
      "icon": Icons.add,
      "text": "",
    },
    {
      "icon": Icons.person,
      "text": "Profile".tr,
    },
  ];
  List pages = [
    const HomePage(),
    const SizedBox(),
    const 
  ProfilePage()
  ];


      @override
  changePage(index) {
    currentPage = index;
 
    update();
  }
  @override
  styleinit() {
        AppColor.bg_brand_soli = Color(
        appService.sharedPreferences.getDouble("style") != null
            ? appService.sharedPreferences.getDouble("style")!.toInt()
            : 0xFF444CE7);
  }


@override
  void onInit() {
  styleinit();
    super.onInit();
  }
  

}
