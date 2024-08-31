import 'package:get/get.dart';

import '../controllers/praytime_controller.dart';

class PraytimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PraytimeController>(
      () => PraytimeController(),
    );
  }
}
