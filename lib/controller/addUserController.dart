import 'package:chat_app/core/class/stasusRecuest.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:chat_app/data/datascore/remote/homeData.dart';
import 'package:chat_app/data/datascore/remote/usersData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddUserController extends GetxController {
  createChatRoom();
  getUsers();
  getMeData();
}

class AddUserControllerImp extends AddUserController {
  late TextEditingController userName;
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  AppService appService = Get.find();
  ChatRoomsData chatRoomsData = ChatRoomsData();
  Usersdata usersdata = Usersdata();
  Stasusrecuest stasusrecuest = Stasusrecuest.success;
  String? to_name;
  var to_user = [].obs;
  var from_user = [].obs;

  @override
  createChatRoom() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      stasusrecuest = Stasusrecuest.loading;
      update();
      String userUid = appService.sharedPreferences.getString("user_uid")!;
      chatRoomsData.addUserToMyUsers(
        userUid,
        email.text,
      );
      chatRoomsData.addChatRoom(
        // from data
        from_user[0]["image"],
        from_user[0]["name"],
        from_user[0]["id"],
        from_user[0]["email"],
        from_user[0]["token"],
        true,
        false,
        "",
        "",
        // to data
        userName.text,
        to_user[0]["image"],
        email.text,
        to_user[0]["token"],
        false,
        false,
        false,
        false,
      );
      stasusrecuest = Stasusrecuest.success;
      update();
      Get.offNamed(AppRoutes.navigationBarPge);
    }
  }

  @override
  void getUsers() async {
    stasusrecuest = Stasusrecuest.loading;
    update();
    usersdata.getUser(email.text).listen((querySnapshot) {
      to_user.value = querySnapshot.docs;

      if (to_user.isNotEmpty) {
        createChatRoom();
        stasusrecuest = Stasusrecuest.success;
        update();
      } else {
        Get.defaultDialog(
          buttonColor: AppColor.bg_brand_soli,
          cancelTextColor: AppColor.bg_brand_soli,
          backgroundColor: AppColor.background,
          title: "Invalid_Email".tr,
          middleText: "Invalid_Email_Or_User".tr,
          onCancel: () {},
        );
      }
    });
    stasusrecuest = Stasusrecuest.success;
    update();
  }

  @override
  getMeData() {
    stasusrecuest = Stasusrecuest.loading;
    update();
    String user_Email = appService.sharedPreferences.getString("user_email")!;
    usersdata.getUser(user_Email).listen((querySnapshot) {
      from_user.value = querySnapshot.docs;
      stasusrecuest = Stasusrecuest.success;
      update();
    });
  }

  @override
  void dispose() {
    email.dispose();
    userName.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    email = TextEditingController();
    userName = TextEditingController();
    getMeData();
    super.onInit();
  }
}
