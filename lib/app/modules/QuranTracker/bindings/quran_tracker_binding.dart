import 'package:get/get.dart';

import '../controllers/quran_tracker_controller.dart';

class QuranTrackerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuranTrackerController>(
      () => QuranTrackerController(),
    );
  }
}
