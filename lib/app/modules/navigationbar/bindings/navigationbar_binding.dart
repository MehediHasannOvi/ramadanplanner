import 'package:get/get.dart';
import 'package:ramadanplanner/app/modules/compass/controllers/compass_controller.dart';
import 'package:ramadanplanner/app/modules/home/controllers/home_controller.dart';
import 'package:ramadanplanner/app/modules/praytime/controllers/praytime_controller.dart';
import 'package:ramadanplanner/app/modules/settings/controllers/settings_controller.dart';

import '../controllers/navigationbar_controller.dart';

class NavigationbarBinding extends BindingsInterface {
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
     Get.lazyPut<CompassController>(
      () => CompassController(),
    );
  }
}
