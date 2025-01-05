import 'package:get/get.dart';
import 'package:ramadan_planner/app/modules/home/controllers/home_controller.dart';
import 'package:ramadan_planner/app/modules/praytime/controllers/praytime_controller.dart';
import 'package:ramadan_planner/app/modules/ramadancalendar/controllers/ramadancalendar_controller.dart';
import 'package:ramadan_planner/app/modules/settings/controllers/settings_controller.dart';

import '../controllers/navigationbar_controller.dart';

class NavigationbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationbarController>(
      () => NavigationbarController(),
    );
     Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<PraytimeController>(
      () => PraytimeController(),
    );
     Get.lazyPut<RamadancalendarController>(
      () => RamadancalendarController(),
    );
  }
}
