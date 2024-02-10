import 'package:get/get.dart';

import '../controllers/pray_tracker_controller.dart';

class PrayTrackerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrayTrackerController>(
      () => PrayTrackerController(),
    );
  }
}
