import 'package:get/get.dart';

import '../controllers/daily_tracking_controller.dart';

class DailyTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyTrackingController>(
      () => DailyTrackingController(),
    );
  }
}
