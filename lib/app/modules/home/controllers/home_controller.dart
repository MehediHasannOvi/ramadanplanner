import 'dart:async';


import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import '../../../../Util/app_colors.dart';
import '../../../../Util/main_button.dart';
import '../../../../notification/notification.dart';
import '../../../data/dinerkaj.dart';
import '../../../data/hadis.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final TextEditingController name = TextEditingController();

  int getDataIndexForCurrentDate() {
    // Get the current date
    HijriCalendar currentDate = HijriCalendar.now();

    // Use the day of the year as the index for the list
    int dataIndex = currentDate.hDay % dinerkaj.length;

    triggerNotification(
        "আজকের দিনের কাজ",
        dinerkaj[dataIndex],
      );

    print(dinerkaj.length);
    return dataIndex;
  }

  sendNotification() {
    int time = DateTime.now().hour;

    if (time == 9) {
      Timer(
        const Duration(
           seconds: 2 
        ), () {
      triggerNotification(
        "আজকের দিনের কাজ",
        dinerkaj[getDataIndexForCurrentDate()],
      );
    });
    } 
  }

  int hadiss() {
    // Get the current date
    HijriCalendar currentDate = HijriCalendar.now();

    // Use the day of the year as the index for the list
    int dataIndex = currentDate.hDay % hadis.length;
    print(hadis.length);
    return dataIndex;
  }

  getusername() {
    Timer(const Duration(seconds: 0), () {
      Get.defaultDialog(
          backgroundColor: AppColors.secondaryColor,
          buttonColor: AppColors.quaternaryColor,
          titleStyle: const TextStyle(color: Colors.white),
          titlePadding: const EdgeInsets.all(10),
          confirmTextColor: Colors.black,
          barrierDismissible: false,
          radius: 5,
          title: "Hello Please Submit Your Name",
          content: TextFormField(
              controller: name,
              decoration: const InputDecoration(
                hintText: "Enter Your Name",
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.white)),
          textConfirm: "Submit",
          onConfirm: () {
            if (name.text.isEmpty && name.text.length < 3) {
              Get.snackbar("Error", "Please Enter Your Name",
                  colorText: Colors.black,
                  backgroundColor: AppColors.quaternaryColor,
                  snackPosition: SnackPosition.BOTTOM);
            } else {
              Hive.box("user").put("name", name.text);
              Get.back();
              update();
              onClose();
            }
          });
    });

    // return Hive.box('user').get('name');
  }
  // return dinerkaj[i++];

  // if (time == timeServer.get(keytime)) {
  //   print("This Funsion ar Work  002 ${timeServer.get(keytime)}");
  //   return dinerkaj[i++];
  // } else {
  //   print("This Funsion ar Work  0023 ${timeServer.get(time)}");
  //   const Text("No");
  // }

  // final List mainBUtton = [
  //   manuButton("নামাজ", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
  //   manuButton("দিনের কাজ", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
  //   manuButton("Pray Tracker", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
  //   manuButton("Pray Tracker", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
  // ];

  @override
  void onInit() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
     
    
    // TODO: implement onInit
    if (Hive.box("user").get("name") == null) {
      getusername();
    } else {
      print("User Name is ${Hive.box("user").get("name")}");
    }
    // sendNotification();
    // getpraylanght;
    super.onInit();
  }
}
