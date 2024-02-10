import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import '../../../../Util/app_colors.dart';
import '../controllers/bottombar_controller.dart';

class BottombarView extends GetView<BottombarController> {
  const BottombarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottombarController>(
      init: BottombarController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.pages,
          ),
          bottomNavigationBar: FlashyTabBar(
            items: controller.itemList,
            onItemSelected: (value) {
              controller.changeIndex(value);
            },
            selectedIndex: controller.currentIndex.value,
            height: 55,
            
            backgroundColor: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
