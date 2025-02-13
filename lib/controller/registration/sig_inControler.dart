import 'package:chat_app/core/class/stasusRecuest.dart';
import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/function/Dialog.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:chat_app/data/datascore/remote/homeData.dart';
import 'package:chat_app/data/datascore/remote/usersData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Sig_inController extends GetxController {
  sig_in();
  gotToForgetPassword();
  goToLogin();
  getUserData(String email);
  saveUserData(
      bool isSign_in, String user_uid, String user_email, String user_token);
  getMeData();
  getToken();
  updateToken(String id, String token);
}

class Sig_inControllerImp extends Sig_inController {
  late TextEditingController email;
  late TextEditingController password;
  ChatRoomsData chatRoomsData = ChatRoomsData();
  var userData = [].obs;
  var myUsers = [].obs;
  String? userToken;

  AppService appService = Get.find();
  bool staus = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  FirebaseAuth credential = FirebaseAuth.instance;
  Usersdata usersdata = Usersdata();
  Stasusrecuest stasusrecuest = Stasusrecuest.success;

  sig_in() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      stasusrecuest = Stasusrecuest.loading;
      update();

      try {
        await credential.signInWithEmailAndPassword(
            email: email.text, password: password.text);

        getUserData(email.text);
        if (credential.currentUser!.emailVerified) {
          saveUserData(true, credential.currentUser!.uid,
              credential.currentUser!.email!, userToken!);
          updateToken(credential.currentUser!.uid, userToken!);
          Get.offAllNamed(AppRoutes.navigationBarPge);
          stasusrecuest = Stasusrecuest.success;
          update();
        } else {
          credential.currentUser!.sendEmailVerification();
          Custom_diolog("تحقق من الحساب",
              "ستتلقى رسالة للتحقق من بريدك الإلكتروني ، يرجى التحقق وتسجيل الدخول مرة أخرى");
          stasusrecuest = Stasusrecuest.success;
          update();
        }
      } on FirebaseAuthException catch (e) {
        // Hata durumlarına göre mesajları göster
        switch (e.code) {
          case 'user-not-found':
            Get.snackbar("البريد الإلكتروني غير موجود",
                "لا يوجد بريد إلكتروني مرتبط بهذا الحساب. يرجى التحقق من البريد الإلكتروني والمحاولة مرة أخرى.");
            stasusrecuest = Stasusrecuest.success;
            update();
            break;
          case 'wrong-password':
            stasusrecuest = Stasusrecuest.success;
            update();
            Get.snackbar("كلمة المرور خاطئة",
                "يرجى التحقق من كلمة المرور الخاصة بك والمحاولة مرة أخرى.");

            break;
          case 'invalid-email':
            stasusrecuest = Stasusrecuest.success;
            update();
            Get.snackbar("البريد الإلكتروني غير صالح",
                "يرجى إدخال بريد إلكتروني صالح والمحاولة مرة أخرى.");

            break;
          case 'user-disabled':
            stasusrecuest = Stasusrecuest.success;
            update();
            Get.snackbar(
                "الحساب معطل", "تم تعطيل الحساب. يرجى الاتصال بالدعم الفني.");

            break;
          case 'too-many-requests':
            stasusrecuest = Stasusrecuest.success;
            update();
            Get.snackbar("طلب مفرط",
                "لقد قمت بإرسال العديد من الطلبات. يرجى المحاولة مرة أخرى لاحقًا.");

            break;
          default:
            stasusrecuest = Stasusrecuest.success;
            update();
            Get.snackbar("خطأ غير معروف",
                "يرجى التحقق من بيانات اعتمادك والمحاولة مرة أخرى.");
        }
      } catch (e) {
        stasusrecuest = Stasusrecuest.success;
        update();
        Get.snackbar(
            "خطأ", "يرجى التحقق من بيانات اعتمادك والمحاولة مرة أخرى.");
      }
    }
  }

  @override
  gotToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPasswordPage);
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoutes.logInPage);
  }

  @override
  getUserData(email) {
    usersdata.getUser(email).listen((querySnapshot) {
      userData.value = querySnapshot.docs;
      update();
    });
  }

  @override
  saveUserData(isSign_in, user_uid, user_email, user_Token) {
    appService.sharedPreferences.setBool("sig_in", isSign_in);
    appService.sharedPreferences.setString("user_uid", user_uid);
    appService.sharedPreferences.setString("user_email", user_email);
    appService.sharedPreferences.setString("user_token", user_Token);
  }

  @override
  getMeData() {
    String myid = appService.sharedPreferences.getString("user_uid")!;
    chatRoomsData.getMyUsers(myid).listen((querySnapshot) {
      myUsers.value = querySnapshot.docs;
      update();
    });
  }

  @override
  getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    userToken = token;
  }

  @override
  updateToken(String id, String token) {
    usersdata.updateToken(id, token);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    getToken();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
