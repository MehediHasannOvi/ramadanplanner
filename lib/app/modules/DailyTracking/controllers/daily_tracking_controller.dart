import 'package:get/get.dart';
import 'package:hive/hive.dart';

class DailyTrackingController extends GetxController {
  // ignore: todo
  //TODO: Implement DailyTrackingController

  final count = 0.obs;
  bool press = false;

  final dailyData = Hive.box('Dtrack');
  final now = DateTime.now().day;
  hiveDetele() {
    if (dailyData.get('date') == now) {
    } else {
      dailyData.clear();
      update();
    }
  }

  function(bool value) {
    if (value == true) {
      dailyData.put('sokalerJikir', value);
    } else {
      dailyData.delete(
        'sokalerJikir',
      );
    }
    update();
    onClose();
  }

  function2(bool value) {
    if (value == true) {
      dailyData.put('sondarJikir', value);
    } else {
      dailyData.delete(
        'sondarJikir',
      );
    }
    update();
    onClose();
  }

  function3(bool value) {
    if (value == true) {
      dailyData.put('dansadka', value);
    } else {
      dailyData.delete(
        'dansadka',
      );
    }
    update();
    onClose();
  }

  function4(bool value) {
    if (value == true) {
      dailyData.put('dinerkaj', value);
    } else {
      dailyData.delete(
        'dinerkaj',
      );
    }
    update();
    onClose();
  }

  function5(bool value) {
    if (value == true) {
      dailyData.put('jamatenamaz', value);
    } else {
      dailyData.delete(
        'jamatenamaz',
      );
    }
    update();
    onClose();
  }

  function6(bool value) {
    if (value == true) {
      dailyData.put('istegfa', value);
    } else {
      dailyData.delete(
        'istegfa',
      );
    }
    update();
    onClose();
  }

  function7(bool value) {
    if (value == true) {
      dailyData.put('quranteloyat', value);
    } else {
      dailyData.delete(
        'quranteloyat',
      );
    }
    update();
    onClose();
  }

  function8(bool value) {
    if (value == true) {
      dailyData.put('allahnammukhosto', value);
    } else {
      dailyData.delete(
        'allahnammukhosto',
      );
    }
    update();
    onClose();
  }

  function9(bool value) {
    if (value == true) {
      dailyData.put('ghumerzikir', value);
    } else {
      dailyData.delete(
        'ghumerzikir',
      );
    }
    update();
    onClose();
  }

   @override
  void onReady() {
    dailyData.put('date', now);
    // ignore: todo
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    hiveDetele();
    super.onInit();
  }
}
