import 'package:get/get.dart';
import 'package:ramadanplanner/app/modules/praytime/controllers/praytime_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
     Get.lazyPut<PraytimeController>(
      () => PraytimeController(),
    );
  }
}
