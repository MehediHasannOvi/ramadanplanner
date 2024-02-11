import 'package:get/get.dart';

import '../modules/AllahName/bindings/allah_name_binding.dart';
import '../modules/AllahName/views/allah_name_view.dart';
import '../modules/DailyTracking/bindings/daily_tracking_binding.dart';
import '../modules/DailyTracking/views/daily_tracking_view.dart';
import '../modules/PrayTracker/bindings/pray_tracker_binding.dart';
import '../modules/PrayTracker/views/pray_tracker_view.dart';
import '../modules/QuranTracker/bindings/quran_tracker_binding.dart';
import '../modules/QuranTracker/views/quran_tracker_view.dart';
import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/bottombar/bindings/bottombar_binding.dart';
import '../modules/bottombar/views/bottombar_view.dart';
import '../modules/calander/bindings/calander_binding.dart';
import '../modules/calander/views/calander_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOMBAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRAY_TRACKER,
      page: () => const PrayTrackerView(),
      binding: PrayTrackerBinding(),
    ),
    GetPage(
      name: _Paths.DAILY_TRACKING,
      page: () => const DailyTrackingView(),
      binding: DailyTrackingBinding(),
    ),
    GetPage(
      name: _Paths.ALLAH_NAME,
      page: () => const AllahNameView(),
      binding: AllahNameBinding(),
    ),
    GetPage(
      name: _Paths.QURAN_TRACKER,
      page: () => const QuranTrackerView(),
      binding: QuranTrackerBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBAR,
      page: () => const BottombarView(),
      binding: BottombarBinding(),
    ),
    GetPage(
      name: _Paths.CALANDER,
      page: () => const CalanderView(),
      binding: CalanderBinding(),
    ),
  ];
}
