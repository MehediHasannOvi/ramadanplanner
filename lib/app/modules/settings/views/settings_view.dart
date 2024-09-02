import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ramadanplanner/Util/app_colors.dart';
import 'package:ramadanplanner/Util/app_text.dart';
import 'package:ramadanplanner/app/modules/settings/screen/privacy.dart';
import 'package:ramadanplanner/app/modules/settings/screen/terms.dart';
import 'package:sizer/sizer.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: AppText(
            text: "Settings",
            color: Colors.white,
            fontFamily: "Lato",
            fontSize: 14.sp,
          )),
          body: Container(
            margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: ListView(
              children: [
                AppText(
                  text: "Genaral",
                  color: AppColors.quinaryColor,
                  fontFamily: "Lato",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                settingButton(
                    leadingIcon: Icons.language,
                    title: "Languages",
                    trailingIcon: Icons.arrow_forward_ios,
                    isIcon: true),
                settingButton(
                    leadingIcon: Icons.notifications_outlined,
                    title: "Notification",
                    trailingIcon: Icons.check_box_outline_blank,
                    isIcon: true),
                AppText(
                  text: "Theme",
                  color: AppColors.quinaryColor,
                  fontFamily: "Lato",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                settingButton(
                    leadingIcon: Icons.dark_mode_outlined,
                    title: "Dark Mode",
                    trailingIcon: Icons.check_box_outline_blank,
                    isIcon: true),
                AppText(
                  text: "Application",
                  color: AppColors.quinaryColor,
                  fontFamily: "Lato",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                settingButton(
                    leadingIcon: Icons.description_outlined,
                    title: "Terms and Conditions",
                    trailingIcon: Icons.arrow_forward_ios,
                    isIcon: true,
                    ontap: () {
                      Get.to(() => const Terms());
                    }),
                settingButton(
                    leadingIcon: Icons.privacy_tip_outlined,
                    title: "Privacy Policy",
                    trailingIcon: Icons.arrow_forward_ios,
                    isIcon: true,
                    ontap: () {
                      Get.to(() => const Privacy());
                    }),
                settingButton(
                    leadingIcon: Icons.mail_outline,
                    title: "Help and Feedback",
                    trailingIcon: Icons.arrow_forward_ios,
                    isIcon: true,
                    ontap: () {
                      controller.applaunchUrl();
                    }),
                settingButton(
                    leadingIcon: Icons.info_outlined,
                    title: "Version",
                    trailingIcon: Icons.arrow_forward_ios,
                    isIcon: false,
                    ontap: null),
              ],
            ),
          )),
    );
  }

  // Setting Button Widget

  settingButton(
      {IconData? leadingIcon,
      String? title,
      IconData? trailingIcon,
      bool? isIcon,
      Function? ontap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.white,
        ),
        title: AppText(
          text: title!,
          color: Colors.white,
          fontFamily: "Lato",
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        trailing: isIcon! // a boolean value
            ? Icon(
                trailingIcon, // Your desired icon
                color: Colors.white,
                size: 15,
              )
            : const Text(
                "1.0",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
        onTap: () {
          ontap!();
        },
      ),
    );
  }
}
