import 'package:chat_app/controller/profileController.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/fontStyle.dart';
import 'package:chat_app/data/datascore/static/profile.dart';
import 'package:chat_app/view/widget/profile/custom_dark_mode_button.dart';
import 'package:chat_app/view/widget/profile/custom_settingsCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsListview extends StatelessWidget {
  const SettingsListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImp>(
      builder: (controller) => Column(
        children: [
          ...List.generate(
            profileData.length,
            (index) => SettingCard(
              onTap: profileData[index].onTap!,
              iconData: profileData[index].icon!,
              title: profileData[index].text!,
            ),
          ),
          Switched_setting_button(
            iconData: Icons.dark_mode,
            onChanged: (p0) {
              controller.cahngeDarkMode();
            },
            title: "Dark_Mode".tr,
            value: controller.dark_mode!,
          ),
          SettingCard(
            title: "Share_App".tr,
            iconData: Icons.share,
            onTap: () {
              controller.shareApp();
            },
          ),
          SettingCard(
            title: "About".tr,
            iconData: Icons.developer_mode_sharp,
            onTap: () {
              Get.defaultDialog(
                backgroundColor: AppColor.background,
                title: "About_Us".tr,
                middleText: "This_app_allows".tr,
                textConfirm: "Ok",
                onConfirm: () {
                  Get.back();
                },
              );
            },
          ),
          SettingCard(
            title: "Help".tr,
            iconData: Icons.help_outline,
            onTap: () {
              Get.defaultDialog(
                backgroundColor: AppColor.background,
                title: "Help".tr,
                middleText: "",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email".tr,
                      style: AppTextStyle.semiBold16_24
                          .copyWith(color: AppColor.bg_brand_solid),
                    ),
                    Text("suveydt@gmail.com"),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Phone".tr,
                      style: AppTextStyle.semiBold16_24
                          .copyWith(color: AppColor.bg_brand_solid),
                    ),
                    Text("05395443779"),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Working_Hours".tr,
                      style: AppTextStyle.semiBold16_24
                          .copyWith(color: AppColor.bg_brand_solid),
                    ),
                    Text("8-10 AM"),
                  ],
                ),
                textConfirm: "Ok".tr,
                onConfirm: () {
                  Get.back();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
