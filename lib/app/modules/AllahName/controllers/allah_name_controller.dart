import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../model/allahname.dart';

class AllahNameController extends GetxController {
  // ignore: todo
  //TODO: Implement AllahNameController

   @override
  void onInit() {
    getName();
    // print(allahnameList[0]);
    super.onInit();
  }

  Future<List<Allahname>> getName() async {
    String data = await rootBundle.loadString('assets/json/Allahname.json');
    List mapData = json.decode(data);
    List<Allahname> allahnameList =
        mapData.map((e) => Allahname.fromJson(e)).toList();
    return allahnameList;
  }

  @override
  void onReady() {
    getName();
    super.onReady();
  }
}
