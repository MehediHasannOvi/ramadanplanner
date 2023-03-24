import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuranTrackerController extends GetxController {
  //TODO: Implement QuranTrackerController

  TextEditingController ayatController = TextEditingController();
  TextEditingController paraController = TextEditingController();
  TextEditingController pageController = TextEditingController();

  bool visibility = false;

  visibilitychange(dynamic value) {
    if (ayatController.text.isEmpty &&
        paraController.text.isEmpty &&
        pageController.text.isEmpty) {
      visibility = false;
      update();
      onDelete();
    } else {
      visibility = true;
    }
    update();
    onDelete();
  }
}
