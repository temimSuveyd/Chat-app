import 'dart:io';
import 'package:chat_app/core/class/stasusRecuest.dart';
import 'package:chat_app/core/constanst/images.dart';
import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:chat_app/data/datascore/remote/usersData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constanst/color.dart';

abstract class Log_inController extends GetxController {
  log_in();
  gotToForgetPassword();
  goToSign_in();
  pickeImage();
  style_int();
  getToken();
  addUserData(String serame, String email, String seruid, String imae, token);
}

class Log_inControllerImp extends Log_inController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController firstName;
  late TextEditingController lastName;
  bool staus = true;
  bool image_stats = true;

  AppService appService = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Usersdata usersdata = Usersdata();
  String user_image = AppImages.user_image;
  Stasusrecuest stasusrecuest = Stasusrecuest.success;
  final image_picker = ImagePicker();
  String? userToken;

  @override
  log_in() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      stasusrecuest = Stasusrecuest.loading;
      update();

      try {
        var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        addUserData("${firstName.text} ${lastName.text}", email.text,
            data.user!.uid, user_image, userToken);

        stasusrecuest = Stasusrecuest.success;
        Get.toNamed(AppRoutes.sigInPage);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar("خطأ", "كلمة المرور المقدمة ضعيفة جدا");
          stasusrecuest = Stasusrecuest.success;
          update();
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
              "خطأ", "الحساب موجود بالفعل لرسالة البريد الإلكتروني هذه.");
          stasusrecuest = Stasusrecuest.success;
          update();
        }
      } catch (e) {
        Get.snackbar("خطأ", e.toString());
        stasusrecuest = Stasusrecuest.success;
        update();
      }
    } else {}
  }

  @override
  gotToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPasswordPage);
  }

  @override
  goToSign_in() {
    Get.toNamed(AppRoutes.sigInPage);
  }

  @override
  pickeImage() async {

    image_stats = false;
    update();
    final picedImage = await image_picker.pickMedia();
    if (picedImage != null) {
      File file = File(picedImage.path);
      String fileName = picedImage.name;

      Reference storageRef =
          FirebaseStorage.instance.ref().child('files/$fileName');

      await storageRef.putFile(file);

      String downloadUrl = await storageRef.getDownloadURL();
      user_image = downloadUrl.toString();
      update();
    }

    image_stats = true;
    update();
    
  }

  @override
  style_int() {
    AppColor.bg_brand_soli = Color(
        appService.sharedPreferences.getDouble("style") != null
            ? appService.sharedPreferences.getDouble("style")!.toInt()
            : 0xFF444CE7);
  }

  @override
  getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    userToken = await messaging.getToken();
  }

  @override
  addUserData(String user_name, String user_email, String user_uid,
      String user_image, user_token) {
    usersdata.addUser(user_name, user_email, user_uid, user_image, user_token);
  }

  @override
  void onInit() {
    getToken();
    email = TextEditingController();
    password = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    style_int();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    firstName.dispose();
    lastName.dispose();
    super.dispose();
  }
}
