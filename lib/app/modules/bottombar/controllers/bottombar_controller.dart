import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Util/app_colors.dart';
import '../../AllahName/views/allah_name_view.dart';
import '../../about/views/about_view.dart';
import '../../calander/views/calander_view.dart';
import '../../home/views/home_view.dart';

class BottombarController extends GetxController {

  // here we have 4 pages
  var currentIndex = 0.obs;
  void changeIndex(int index) {
    currentIndex.value = index;
    update();
  }
 // here we have 4 pages
  final List<Widget> pages = [
    const HomeView(),
    const CalanderView(),
    const AllahNameView(),
    const AboutView(),
  ];
 
 // here we have 4 items

  final List<FlashyTabBarItem> itemList = [
    FlashyTabBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: const Text('Home'),
      activeColor: AppColors.quinaryColor,
      inactiveColor: Colors.white,
    ),
    FlashyTabBarItem(
      icon: const Icon(CupertinoIcons.calendar),
      title: const Text('Calander'),
      activeColor: AppColors.quinaryColor,
      inactiveColor: Colors.white,
    ),
    FlashyTabBarItem(
      icon: const Icon(CupertinoIcons.rectangle_3_offgrid),
      title: const Text('Categories'),
      activeColor: AppColors.quinaryColor,
      inactiveColor: Colors.white,
    ),
    FlashyTabBarItem(
      icon: const Icon(Icons.settings),
      title: const Text('Settings'),
      activeColor: AppColors.quinaryColor,
      inactiveColor: Colors.white,
    ),
  ];
}
