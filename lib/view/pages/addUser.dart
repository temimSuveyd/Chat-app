import 'package:chat_app/controller/addUserController.dart';
import 'package:chat_app/core/class/handlingDataView.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/core/function/validator_input.dart';
import 'package:chat_app/view/widget/addUser/custom_button.dart';
import 'package:chat_app/view/widget/addUser/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddUserControllerImp());
    return GetBuilder<AddUserControllerImp>(
        builder: (controller) => HandlingDataView(
              stasusrecuest: controller.stasusrecuest,
              widget: Form(
                key: controller.formState,
                child: Scaffold(
                  backgroundColor: AppColor.background,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.navigate_before,
                                  size: 30,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                     "Add_New_User".tr,
                              style: AppTextStyle.bold20_28,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        textField(
                            onChanged: (p0) {},
                      hintText: "Name".tr,
                            validator: (p0) {
                              return null;
                            
                        
                            },
                            keyboardType: TextInputType.name,
                            controller: controller.userName,
                            enabled: true),
                        const SizedBox(
                          height: 15,
                        ),
                        textField(
                            onChanged: (p0) {},
               hintText: "Email".tr,
                            validator: (p0) {
                              return validatorInput(p0!, 2, 15, "email");
                            },
                            keyboardType: TextInputType.name,
                            controller: controller.email,
                            enabled: true),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButtom(
                          ontap: () {
                            controller.getUsers();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
