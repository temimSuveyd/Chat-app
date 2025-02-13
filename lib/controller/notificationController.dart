import 'package:chat_app/core/services/AppService.dart';
import 'package:get/get.dart';

abstract class NotificationController extends GetxController {
  setNtoificationStats(bool stats);
}

class NotificationControllerImp extends NotificationController {
  AppService appService = Get.find();
  bool buttom_stats = true;

  @override
  setNtoificationStats(bool stats) {
    if (stats == false) {
      buttom_stats = true;
      appService.sharedPreferences.setBool("notifi", false);
      update();
    } else {
      buttom_stats = false;
      appService.sharedPreferences.setBool("notifi", true);
      update();
    }
    update();
  }
}
