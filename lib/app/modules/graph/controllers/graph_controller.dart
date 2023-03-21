import 'package:get/get.dart';

class GraphController extends GetxController {
  //TODO: Implement GraphController
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 6,
    "Xamarin": 4,
    "Ionic": 1,
    
  };
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
