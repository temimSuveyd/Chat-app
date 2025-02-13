import 'dart:ui';

import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:get/get.dart';

abstract class  OnBoardingControler extends GetxController {
  goToNextPage();
  inti_style();
}



class OnBoardingControllerImp extends OnBoardingControler {

AppService appService = Get.find();

  @override
  goToNextPage() {
   Get.toNamed(AppRoutes.sigInPage);
  }
  
  @override
  inti_style() {
    AppColor.bg_brand_soli = Color(
        appService.sharedPreferences.getDouble("style") != null
            ? appService.sharedPreferences.getDouble("style")!.toInt()
            : 0xFF444CE7);
  }
  
  @override
  void onInit() {
   inti_style();
    super.onInit();
  }


}