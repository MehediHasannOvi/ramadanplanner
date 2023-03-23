import 'package:adhan/adhan.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PrayTrackerController extends GetxController {
  // RxBool fazar =   false.obs;

  final namazData = Hive.box('daily');




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
      namazData.put('tahajud', value);
    } else {
      namazData.delete(
        'tahajud',
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
}
