import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../Util/app_colors.dart';

class QuranTrackerController extends GetxController {
  // ignore: todo
  //TODO: Implement QuranTrackerController

  TextEditingController ayatController = TextEditingController();
  TextEditingController paraController = TextEditingController();
  TextEditingController pageController = TextEditingController();

  bool visibility = false;

  final quranData = Hive.box('quranData');
  final now = DateTime.now();

  visibilitychange(dynamic value) {
    if (ayatController.text.isEmpty &&
        paraController.text.isEmpty &&
        pageController.text.isEmpty) {
      visibility = false;
      update();
      // onDelete();
    } else {
      visibility = true;
    }
    update();
    // onDelete();
  }

  

  getquranData() {
    if (ayatController.text.isNotEmpty &&
        paraController.text.isNotEmpty &&
        pageController.text.isNotEmpty) {
      quranData.put("ayat", ayatController.text);
      quranData.put("para", paraController.text);
      quranData.put("page", pageController.text);
      // Get.offNamed(Routes.HOME);
      ayatController.clear();
      paraController.clear();
      pageController.clear();
      update();
      Get.snackbar("ধন্যবাদ", "আপনার ডাটা সাবমিট করা হয়েছে ",
          colorText: Colors.black,
          backgroundColor: AppColors.quaternaryColor,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Error", "অনুগ্রহ করে ফর্মটি পূরণ করুন",
          colorText: Colors.black,
          backgroundColor: AppColors.quaternaryColor,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    // ignore: todo
    // TODO: implement onClose
    ayatController.clear();
    paraController.clear();
    pageController.clear();

    super.onClose();
  }
}
