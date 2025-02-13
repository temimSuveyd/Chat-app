import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class AppStyleController extends GetxController {
  changeColor(int index);

  saveStyle(Color color);
}

class AppsTyleControllerImp extends AppStyleController {
AppService appService  = Get.find();

  int color_index = 0;
  @override
  changeColor(index) {
    color_index = index;
    update();
  }
  
  @override
  saveStyle(color) {
appService.sharedPreferences.setDouble("style", color.value.toDouble());
    AppColor.bg_brand_soli =
        Color(appService.sharedPreferences.getDouble("style")!.toInt());
Get.toNamed(AppRoutes.navigationBarPge);
update();
  }
}
