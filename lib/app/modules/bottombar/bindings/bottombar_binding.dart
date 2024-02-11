import 'package:get/get.dart';

import '../../AllahName/controllers/allah_name_controller.dart';
import '../../DailyTracking/controllers/daily_tracking_controller.dart';
import '../../about/controllers/about_controller.dart';
import '../../calander/controllers/calander_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/bottombar_controller.dart';

class BottombarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottombarController>(
      () => BottombarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AboutController>(
      () => AboutController(),
    );
    Get.lazyPut<DailyTrackingController>(
      () => DailyTrackingController(),
    );
    Get.lazyPut<AllahNameController>(
      () => AllahNameController(),
    );
     Get.lazyPut<CalanderController>(
      () => CalanderController(),
    );
  }
  
}
