import 'package:chat_app/controller/registration/sig_inControler.dart';
import 'package:chat_app/core/class/handlingDataView.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/core/constanst/images.dart';
import 'package:chat_app/core/function/validator_input.dart';
import 'package:chat_app/view/widget/registration/custom_forgetPasswordButton.dart';
import 'package:chat_app/view/widget/registration/custom_Button.dart';
import 'package:chat_app/view/widget/registration/custom_textBody.dart';
import 'package:chat_app/view/widget/registration/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sig_inPage extends GetView<Sig_inControllerImp> {
  const Sig_inPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Sig_inControllerImp());
    return Scaffold(
      backgroundColor:  AppColor.background,
        body: GetBuilder<Sig_inControllerImp>(
      builder: (controller) => Form(
        key: controller.formState,
        child: HandlingDataView(
          stasusrecuest: controller.stasusrecuest ,
          widget: 
       Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppImages.log_in_background,
                    ),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                
                children: [
       SizedBox(height: 50),
          TextBoy(
  title: "Welcome_back_again".tr,
  body: "We_are_excited_to_see_you_again".tr,
),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                  "Account_Information".tr,
                        style: AppTextStyle.semiBold14_20
                            .copyWith(color:AppColor.text_secondary),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  textField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (p0) {
                      return validatorInput(p0!, 2, 30, "email");
                    },
                    controller: controller.email,
               hintText: "Email".tr,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  textField(
                    keyboardType: TextInputType.visiblePassword,
                    validator: (p0) {
                      return validatorInput(p0!, 5, 30, "password");
                    },
                    controller: controller.password,
           hintText: "Password".tr,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  forgetPasswordButton(
                    onTap: () {
                      controller.gotToForgetPassword();
                    },
                  ),
                  const SizedBox(height: 24),
                  Custom_button(
          text: "Login".tr,
                    onTap: () {
                      if (controller.staus) {
                        controller.sig_in();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("&"),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Custom_button(
                text: "Create_Account".tr,
                    onTap: () {
                      if (controller.staus) {
                        controller.goToLogin();
                      }
                    },
                  ),
         
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
