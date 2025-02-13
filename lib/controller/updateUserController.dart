// import 'dart:html' as html;
import 'dart:io';

import 'package:chat_app/core/class/stasusRecuest.dart';
import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:chat_app/data/datascore/remote/usersData.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class UpdateUserController extends GetxController {
  updateData();
  getUserData();
  textFieldType(String email, String name);
  pickedImage();
}

class UpdateUserControllerImp extends UpdateUserController {
  late TextEditingController email;
  late TextEditingController name;
  final image_picker = ImagePicker();

  bool status = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late Stasusrecuest stasusrecuest;
  Usersdata usersdata = Usersdata();
  AppService appService = Get.find();
  String? user_image;
  var userData = [].obs;

  bool imageStats = false;
  @override
  updateData() {
    String user_uid = appService.sharedPreferences.getString("user_uid")!;

    stasusrecuest = Stasusrecuest.loading;
    update();
    try {
      usersdata.updateData(name.text , user_image!, user_uid);
      stasusrecuest = Stasusrecuest.success;
      update();
      Get.toNamed(AppRoutes.navigationBarPge);
    } catch (e) {
      Get.defaultDialog();
      stasusrecuest = Stasusrecuest.serverFilur;
      update();
    }
  }

  @override
  getUserData() {
    stasusrecuest = Stasusrecuest.loading;
    update();
    String userEmail = appService.sharedPreferences.getString("user_email")!;

    try {
      usersdata.getUser(userEmail).listen((querySnapshot) {
        userData.value = querySnapshot.docs;
        textFieldType(userData[0]["email"], userData[0]["name"]);
        user_image = userData[0]["image"];
        stasusrecuest = Stasusrecuest.success;
        update();
      });
      stasusrecuest = Stasusrecuest.success;
      update();
    } catch (e) {
      stasusrecuest = Stasusrecuest.serverFilur;
      update();
    }
  }

  @override
  textFieldType(email_, name_) {
    email = TextEditingController(text: email_);
    name = TextEditingController(text: name_);
  }

  @override
  pickedImage() async {
    String user_uid = appService.sharedPreferences.getString("user_uid")!;

    imageStats = true;
    update();
    final picedImage = await image_picker.pickMedia();
    if (picedImage != null) {
      File file = File(picedImage.path);
      String fileName = picedImage.name;
      Reference storageRef =
          FirebaseStorage.instance.ref().child('files/$fileName');
      await storageRef.putFile(file);
      String downloadUrl = await storageRef.getDownloadURL();
      user_image = downloadUrl;
usersdata.updateData(name.text,  user_image! , user_uid);
      imageStats = false;
      update();
    }
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    super.dispose();
  }
}
