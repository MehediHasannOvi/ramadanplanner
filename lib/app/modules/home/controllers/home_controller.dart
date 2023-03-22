import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hive/hive.dart';

import '../../../../Util/main_button.dart';
import '../../../data/dinerkaj.dart';
import '../../../data/hadis.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxInt getpraylanght = Hive.box('daily').length.obs;

  int getDataIndexForCurrentDate() {
    // Get the current date
    HijriCalendar currentDate = HijriCalendar.now();

    // Use the day of the year as the index for the list
    int dataIndex = currentDate.hDay % dinerkaj.length;
    print(dinerkaj.length);
    return dataIndex;
  }

  int hadiss() {
    // Get the current date
    HijriCalendar currentDate = HijriCalendar.now();

    // Use the day of the year as the index for the list
    int dataIndex = currentDate.hDay % hadis.length;
    print(hadis.length);
    return dataIndex;
  }

  // return dinerkaj[i++];

  // if (time == timeServer.get(keytime)) {
  //   print("This Funsion ar Work  002 ${timeServer.get(keytime)}");
  //   return dinerkaj[i++];
  // } else {
  //   print("This Funsion ar Work  0023 ${timeServer.get(time)}");
  //   const Text("No");
  // }

  final List mainBUtton = [
    manuButton("Pray Tracker", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
    manuButton("Pray Tracker", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
    manuButton("Pray Tracker", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
    manuButton("Pray Tracker", "1/13", () => Get.toNamed(Routes.PRAY_TRACKER)),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    getpraylanght;
    super.onInit();
  }
}
