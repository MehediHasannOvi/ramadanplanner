import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ramadan_planner/app/data/dinerkaj.dart';
import 'package:ramadan_planner/app/model/locationmodel.dart';
import 'package:ramadan_planner/app/routes/app_pages.dart';
// import 'package:ramadanplanner/app/service/notification/firebasenotification.dart';
import 'package:ramadan_planner/app/service/notification/notification_service_mobile.dart';

class FastscreenController extends GetxController {
  final NotificationService notificationService = NotificationService();

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
          snackPosition: SnackPosition.TOP,
          // backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  screenChange() {
    if (Hive.box("user").get("name") != null) {
      Get.offAllNamed(Routes.NAVIGATIONBAR);
    }
  }

  @override
  void onInit() {
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ), () {
      screenChange();
      update();
      NotificationService().dalyscheduleNotifications(
        payLoad: 'DailyTask',
        title: "আস-সালামু আলাইকুম \n আজকের দিনের কাজ হলো",
        body: "${dinerkaj[DateTime.now().day - 1]}",
        timeSlots: [
          {'hour': 6, 'minute': 0},
          {'hour': 17, 'minute': 0},
        ],
      );
      fetchLocations();
    });

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    super.onClose();
  }
}
