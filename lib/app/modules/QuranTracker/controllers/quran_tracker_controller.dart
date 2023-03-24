import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../Util/app_colors.dart';
import '../../../routes/app_pages.dart';

class QuranTrackerController extends GetxController {
  //TODO: Implement QuranTrackerController

  TextEditingController ayatController = TextEditingController();
  TextEditingController paraController = TextEditingController();
  TextEditingController pageController = TextEditingController();

  bool visibility = false;

  final quranData = Hive.box('quranData');

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
    if (ayatController.text.isEmpty &&
        paraController.text.isEmpty &&
        pageController.text.isEmpty) {
      Get.snackbar("Error", "Please Enter All From",
          colorText: Colors.black,
          backgroundColor: AppColors.quaternaryColor,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      quranData.put("ayat", ayatController.text);
      quranData.put("para", ayatController.text);
      quranData.put("page", ayatController.text);
      // Get.offNamed(Routes.HOME);
       ayatController.clear();
    paraController.clear();
    pageController.clear();
    update();
       Get.snackbar( "ধন্যবাদ","আপনার ডাটা সাবমিট করা হয়েছে ",
          colorText: Colors.black,
          backgroundColor: AppColors.quaternaryColor,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    ayatController.clear();
    paraController.clear();
    pageController.clear();
   
    
    super.onClose();
  }
}
