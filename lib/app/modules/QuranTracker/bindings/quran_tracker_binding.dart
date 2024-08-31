import 'package:get/get.dart';

import '../controllers/quran_tracker_controller.dart';

class QuranTrackerBinding extends BindingsInterface {
  @override
  void dependencies() {
    Get.lazyPut<QuranTrackerController>(
      () => QuranTrackerController(),
    );
  }
}
