import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ramadanplanner/Util/app_colors.dart';
import 'package:ramadanplanner/Util/app_text.dart';
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
            margin: const EdgeInsets.all(25),
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
                    Icons.language, "Languages", Icons.arrow_forward_ios, true),
                settingButton(Icons.notifications_outlined, "Notification",
                    Icons.check_box_outline_blank, true),
                AppText(
                  text: "Theme",
                  color: AppColors.quinaryColor,
                  fontFamily: "Lato",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                settingButton(Icons.dark_mode_outlined, "Dark Mode",
                    Icons.check_box_outline_blank, true),
                AppText(
                  text: "Application",
                  color: AppColors.quinaryColor,
                  fontFamily: "Lato",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                settingButton(Icons.description_outlined,
                    "Terms and Conditions", Icons.arrow_forward_ios, true),
                settingButton(Icons.privacy_tip_outlined, "Privacy Policy",
                    Icons.arrow_forward_ios, true),
                settingButton(Icons.mail_outline, "Help and Feedback",
                    Icons.arrow_forward_ios, true),
                settingButton(Icons.info_outlined, "Version",
                    Icons.arrow_forward_ios, false),
              ],
            ),
          )),
    );
  }

  // Setting Button Widget

  settingButton(
      IconData leadingIcon, String title, IconData trailingIcon, bool isIcon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.white,
        ),
        title: AppText(
          text: title,
          color: Colors.white,
          fontFamily: "Lato",
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        trailing: isIcon // a boolean value
            ? Icon(
                trailingIcon, // Your desired icon
                color: Colors.white,
                size: 15,
              )
            : Text(
                "1.0",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
      ),
    );
  }
}
