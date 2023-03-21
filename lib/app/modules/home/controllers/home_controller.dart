import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Util/main_button.dart';
import '../../../data/dinerkaj.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  int i = 0;
  dinerkajChnage() {
    final time = TimeOfDay.now();
    if (time == TimeOfDay.now()) {
      return dinerkaj[i++];
    } else {
      const Text("No");
    }
  }

  final List mainBUtton = [
    manuButton("Pray Tracker", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
    manuButton("Pray Tracker", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
    manuButton("Pray Tracker", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
    manuButton("Pray Tracker", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
