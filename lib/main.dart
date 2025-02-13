import 'package:chat_app/controller/profileController.dart';
import 'package:chat_app/core/localization/LocalController.dart';
import 'package:chat_app/core/localization/translation.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialServices();

  runApp(const ChatiApp());
}

class ChatiApp extends StatelessWidget with WidgetsBindingObserver {
  const ChatiApp({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controller = Get.put(ProfileControllerImp());
    Localcontroller local_controller = Get.put(Localcontroller());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      getPages: getPages,
      theme:
          controller.dark_mode == true ? ThemeData.dark() : ThemeData.light(),
      locale: local_controller.language,
    );
  }
}
