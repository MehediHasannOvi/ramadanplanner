import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ramadanplanner/app/model/locationmodel.dart';
import 'package:ramadanplanner/app/routes/app_pages.dart';

class FastscreenController extends GetxController {
  final TextEditingController name = TextEditingController();
  List<LocationModel> locationList = [];
  LocationModel? selectedLocation;

  Future<List<LocationModel>> getLocation() async {
    String data = await rootBundle.loadString('assets/json/locationname.json');
    List mapData = json.decode(data);
    List<LocationModel> locationList =
        mapData.map((e) => LocationModel.fromJson(e)).toList();
    return locationList;
  }

  void fetchLocations() async {
    locationList = await getLocation();
    update();
    // Refresh the UI after fetching the data
  }

  onChangeLocation(LocationModel? location) {
    selectedLocation = location;
    update();
  }

  void saveName() {
    if (name.text.isNotEmpty &&
        selectedLocation != null &&
        name.text.length > 3) {
      Hive.box("user").put("name", name.text);
      Hive.box("user").put("location", selectedLocation!.placeName);
      Hive.box("user").put("latitude", selectedLocation!.lat);
      Hive.box("user").put("longitude", selectedLocation!.lng);
      Get.offAllNamed(Routes.NAVIGATIONBAR);
    } else {
      Get.snackbar("Error", "Please enter a valid name and select a location",
          snackPosition: SnackPosition.top,
          // backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    Future.delayed(Duration.zero, () {
      if (Hive.box("user").get("name") != null) {
        Get.offAllNamed(Routes.NAVIGATIONBAR);
      }
    });

    super.onInit();

    fetchLocations();
  }
}
