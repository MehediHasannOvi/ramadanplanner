import 'package:get/get.dart';

import '../controllers/calander_controller.dart';

class CalanderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalanderController>(
      () => CalanderController(),
    );
  }
}
