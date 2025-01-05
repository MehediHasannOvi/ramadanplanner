import 'package:get/get.dart';

import '../controllers/ramadancalendar_controller.dart';

class RamadancalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RamadancalendarController>(
      () => RamadancalendarController(),
    );
  }
}
