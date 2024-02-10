import 'package:get/get.dart';

import '../controllers/allah_name_controller.dart';

class AllahNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllahNameController>(
      () => AllahNameController(),
    );
  }
}
