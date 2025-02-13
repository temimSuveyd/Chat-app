import 'package:chat_app/core/class/stasusRecuest.dart';
import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/view/widget/registration/custom_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordControler extends GetxController {
  sendPassword();
}

class ForgetPasswordControllerImp extends ForgetPasswordControler {
  late TextEditingController email;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late Stasusrecuest stasusrecuest;

  @override
  sendPassword() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      stasusrecuest = Stasusrecuest.loading;
      update();
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.text,
      );
      stasusrecuest = Stasusrecuest.success;
      update();

      Get.defaultDialog(
          title: "Instructions_sent".tr,
          middleText:
              "We_sent_instruction_to_change_your_password_to ${email.text}".tr,
          actions: [
            const SizedBox(
              height: 30,
            ),
            Custom_button(
              text: "Agree".tr,
              onTap: () {
                Get.toNamed(AppRoutes.logInPage);
              },
            ),
          ]);
      update();
    }
  }

  @override
  void onInit() {
    stasusrecuest = Stasusrecuest.success;
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
