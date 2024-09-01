// ignore_for_file: unused_import, depend_on_referenced_packages, avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:adhan/adhan.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ramadanplanner/Util/app_text.dart';
import 'package:ramadanplanner/app/model/locationmodel.dart';
import 'package:ramadanplanner/app/modules/praytime/controllers/praytime_controller.dart';
import 'package:ramadanplanner/app/routes/app_pages.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../../../Util/app_colors.dart';
import '../../../service/notification/notification.dart';
import '../../../data/dinerkaj.dart';
import '../../../data/hadis.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  
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

  // getusername() {
  //   Timer(const Duration(seconds: 0), () {
  //     Get.defaultDialog(
  //         backgroundColor: AppColors.secondaryColor,
  //         buttonColor: AppColors.quaternaryColor,
  //         titleStyle: const TextStyle(color: Colors.white),
  //         titlePadding: const EdgeInsets.all(10),
  //         confirmTextColor: Colors.black,
  //         barrierDismissible: false,
  //         radius: 5,
  //         title: "আপনার নাম এবং লোকেশন সিলেক্ট করুন",
  //         content:
          
  //         onConfirm: () {
           
  //         });
  //   });
  // }

  // THis function use for Location and Timezone for the app to get the current time and location


  @override
  void onInit() async {
    // ignore: todo
    // TODO: implement onInit
    
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

// here load the location and timezone

    // getpraylanght;
    super.onInit();
  }
}
