import 'package:get/get.dart';

class NavigationbarController extends GetxController {
  var selectedIndex = 0;

  void changeTabIndex(int index) {
    selectedIndex = index;

    update();
  }
}
