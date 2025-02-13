import 'package:get/get.dart';

abstract class ViewImageController extends GetxController {
  initData();
}

class ViewImageControllerImp extends ViewImageController {
  String? image;
  @override
  initData() {
    image = Get.arguments["message"];
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
