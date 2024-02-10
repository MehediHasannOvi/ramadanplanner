import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PrayTrackerController extends GetxController {
  // RxBool fazar =   false.obs;

  final namazData = Hive.box('daily');
  RxBool delete = false.obs;
  final now = DateTime.now().day;
  hiveDetele() {
    if (namazData.get('date') == now) {
    } else {
      namazData.clear();
      update();
    }
  }

  function(bool value) {
    if (value == true) {
      namazData.put('fazar', value);
    } else {
      namazData.delete(
        'fazar',
      );
    }

    update();
    onClose();
  }

  function1(bool value) {
    if (value == true) {
      namazData.put('zohar', value);
    } else {
      namazData.delete(
        'zohar',
      );
    }

    // press = false;
    update();
    onClose();
  }

  function2(bool value) {
    if (value == true) {
      namazData.put('asor', value);
    } else {
      namazData.delete(
        'asor',
      );
    }

    // press = false;
    update();
    onClose();
  }

  function3(bool value) {
    if (value == true) {
      namazData.put('magrib', value);
    } else {
      namazData.delete(
        'magrib',
      );
    }

    // press = false;
    update();
    onClose();
  }

  function4(bool value) {
    if (value == true) {
      namazData.put('isar', value);
    } else {
      namazData.delete(
        'isar',
      );
    }

    // press = false;
    update();
    onClose();
  }

  function5(bool value) {
    if (value == true) {
      namazData.put('Tarabi', value);
    } else {
      namazData.delete(
        'Tarabi',
      );
    }

    // press = false;
    update();
    onClose();
  }

  function6(bool value) {
    if (value == true) {
      namazData.put('duha', value);
    } else {
      namazData.delete(
        'duha',
      );
    }

    // press = false;
    update();
    onClose();
  }

  @override
  void onReady() {
    namazData.put('date', now);
    // ignore: todo
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    hiveDetele();
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
  }
}
