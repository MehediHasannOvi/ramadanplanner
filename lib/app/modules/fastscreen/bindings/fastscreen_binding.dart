import 'package:get/get.dart';

import '../controllers/fastscreen_controller.dart';

class FastscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FastscreenController>(
      () => FastscreenController(),
    );
  }
}
