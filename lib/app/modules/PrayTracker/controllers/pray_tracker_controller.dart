import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:ramadan_planner/app/model/hadismodel.dart';

class PrayTrackerController extends GetxController {
  String? hadisDescription;
  String? hadisName;

  final namazData = Hive.box('daily');
  final RxBool delete = false.obs;
  final int today = DateTime.now().day;

  Future<List<HadisModel>> getHadisData() async {
    String data = await rootBundle.loadString('assets/json/hadis.json');
    List<dynamic> mapData = json.decode(data);

    // Parse into a list of HadisModel
    List<HadisModel> hadisList = mapData.map((e) => HadisModel.fromJson(e)).toList();

    // Randomly select one hadis
    HadisModel randomHadis = hadisList[DateTime.now().minute % hadisList.length];
    hadisDescription = randomHadis.description;
    hadisName = randomHadis.name;

    return hadisList;
  }

  void clearNamazDataIfNeeded() {
    if (namazData.get('date') != today) {
      namazData.clear();
      update();
    }
  }

  void updateNamazData(String prayerName, bool value) {
    if (value) {
      namazData.put(prayerName, value);
    } else {
      namazData.delete(prayerName);
    }
    update();
  }

  void markFajar(bool value) => updateNamazData('fajar', value);
  void markZohar(bool value) => updateNamazData('zohar', value);
  void markAsor(bool value) => updateNamazData('asor', value);
  void markMaghrib(bool value) => updateNamazData('maghrib', value);
  void markIsha(bool value) => updateNamazData('isha', value);
  void markTarawih(bool value) => updateNamazData('tarawih', value);
  void markDuha(bool value) => updateNamazData('duha', value);

  @override
  void onReady() {
    namazData.put('date', today);
    super.onReady();
  }

  @override
  void onInit() {
    clearNamazDataIfNeeded();
    getHadisData();
    super.onInit();
  }
}
