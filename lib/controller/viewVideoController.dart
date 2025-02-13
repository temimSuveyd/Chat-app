import 'package:get/get.dart';

abstract class ViewVideoController extends GetxController {
  initData();
}

class ViewVideoControllerImp extends ViewVideoController {
  String? video;
  @override
  initData() {
    video = Get.arguments["message"];
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
