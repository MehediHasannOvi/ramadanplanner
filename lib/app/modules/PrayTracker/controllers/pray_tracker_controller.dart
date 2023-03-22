import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PrayTrackerController extends GetxController {
  //TODO: Implement PrayTrackerController
  // final pray = Hive.box("pray");

  bool fazar = false;
  bool zohar = false;
  bool asar = false;
  bool magrib = false;
  bool esha = false;
  bool tahajjud = false;
  bool duha = false;

    function(bool value) {
     fazar = value;
    // press = false;
    update();
    
  }
  function1(bool value) {
     zohar = value;
    // press = false;
    update();
    
  }
  function2(bool value) {
     asar = value;
    // press = false;
    update();
    
  }
  function3(bool value) {
     magrib = value;
    // press = false;
    update();
    
  }
  function4(bool value) {
    esha = value;
    // press = false;
    update();
    
  }
  function5(bool value) {
     tahajjud = value;
    // press = false;
    update();
    
  }
  function6(bool value) {
     duha = value;
    // press = false;
    update();
    
  }


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
