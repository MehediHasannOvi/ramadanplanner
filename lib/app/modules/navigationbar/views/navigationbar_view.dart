import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ramadan_planner/Util/app_colors.dart';
import 'package:ramadan_planner/app/modules/home/views/home_view.dart';
import 'package:ramadan_planner/app/modules/praytime/views/praytime_view.dart';
import 'package:ramadan_planner/app/modules/ramadancalendar/views/ramadancalendar_view.dart';
import 'package:ramadan_planner/app/modules/settings/views/settings_view.dart';

import '../controllers/navigationbar_controller.dart';

class NavigationbarView extends GetView<NavigationbarController> {
  const NavigationbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: null,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: GetBuilder<NavigationbarController>(
        builder: (controller) {
          return IndexedStack(
            index: controller.selectedIndex,
            children: const [
              HomeView(),
              PraytimeView(),
              RamadancalendarView(),
              SettingsView(),
            ],
          );
        },
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        color: AppColors.secondaryColor,
        notchColor: AppColors.quinaryColor,
        itemLabelStyle: const TextStyle(color: Colors.white, fontSize: 10),
        bottomBarItems: [
          bottomItem(
            inActiveItem: Icons.home,
            activeItem: Icons.home_outlined,
            itemLabel: 'হোম',
          ),
          bottomItem(
            inActiveItem: Icons.av_timer,
            activeItem: Icons.av_timer_outlined,
            itemLabel: 'নামাজের সময়',
          ),
          bottomItem(
            inActiveItem: Icons.compass_calibration,
            activeItem: Icons.compass_calibration_outlined,
            itemLabel: 'কম্পাস',
          ),
          bottomItem(
            inActiveItem: Icons.settings,
            activeItem: Icons.settings_outlined,
            itemLabel: 'সেটিংস',
          ),
        ],
        notchBottomBarController: NotchBottomBarController(
          index: controller.selectedIndex,
        ),
        onTap: (index) {
          controller.changeTabIndex(index);
        },
        kIconSize: 20,
        kBottomRadius: 10,
        showBlurBottomBar: false,
        showBottomRadius: false,
        removeMargins: true,
      ),
    );
  }

  BottomBarItem bottomItem(
      {required IconData? inActiveItem,
      IconData? activeItem,
      String? itemLabel}) {
    return BottomBarItem(
      inActiveItem: Icon(
        inActiveItem,
        color: AppColors.quinaryColor,
      ),
      activeItem: Icon(
        inActiveItem,
        color: AppColors.secondaryColor,
      ),
      itemLabel: itemLabel,
    );
  }
}
