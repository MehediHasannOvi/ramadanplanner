import 'package:get/get.dart';

import '../controllers/graph_controller.dart';

class GraphBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraphController>(
      () => GraphController(),
    );
  }
}
