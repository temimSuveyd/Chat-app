
import 'package:get/get.dart';

abstract class LanguageController extends GetxController {
  change(int index);
}

class LanguageControllerImp extends LanguageController {
  int lang_index = 0;

  @override
  change(int index) {
    lang_index = index;
    update();
  }
}
