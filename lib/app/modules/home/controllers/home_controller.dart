// ignore_for_file: unused_import, depend_on_referenced_packages, avoid_print

import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ramadanplanner/app/routes/app_pages.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../../../Util/app_colors.dart';
import '../../../service/notification/notification.dart';
import '../../../data/dinerkaj.dart';
import '../../../data/hadis.dart';

class HomeController extends GetxController {
  

  final TextEditingController name = TextEditingController();
  HijriCalendar currentDate = HijriCalendar.now();


  // this function is for diner kaj it will show a diner kaj for the current date

  int getDataIndexForCurrentDate() {
    // Get the current date
    int dataIndex = currentDate.hDay % dinerkaj.length;
   
    // Timer(Duration.zero, () {
    //   sendNotification();
    // });

    return dataIndex;
  }

// this function is for hadis it will show a hadis for the current date

  int hadiss() {
    // Get the current date
    HijriCalendar currentDate = HijriCalendar.now();

    // Use the day of the year as the index for the list
    int dataIndex = currentDate.hDay % hadis.length;
    return dataIndex;
  }

// This function is for edit name button this will show a dialog box to edit name
// and when user fast time open the app it will show a dialog box to enter name

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
          title: "আপনার নাম টি লিখুন ",
          content: TextFormField(
              controller: name,
              decoration: const InputDecoration(
                hintText: "নাম",
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
          textConfirm: "সেভ করুন",
          onConfirm: () {
            if (name.text.isEmpty && name.text.length < 3) {
              Get.snackbar("Error", "Please Enter Your Name",
                  colorText: Colors.black,
                  backgroundColor: AppColors.quaternaryColor,
                  snackPosition: SnackPosition.bottom);
            } else {
              Hive.box("user").put("name", name.text);
              update();
              // Get.back();
              Get.close();
            }
          });
    });
  }

  @override
  void onInit() async {
    // ignore: todo
    // TODO: implement onInit
    if (Hive.box("user").get("name") == null) {
      getusername();
    } 
    getDataIndexForCurrentDate();

    NotificationService()
        .scheduleNotification(
          // scheduledDate: nextInstanceOfOneAm(1),
          title: "আজকের দিনের কাজ",
         body: "${dinerkaj[getDataIndexForCurrentDate()]}",
        )
        .then((value) => print(
              "Notification Scheduled",
            ));

    // getpraylanght;
    super.onInit();
  }
}
