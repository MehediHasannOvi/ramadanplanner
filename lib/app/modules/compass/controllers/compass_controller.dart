import 'dart:async';

import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CompassController extends GetxController {
  final _locationStreamController = StreamController<LocationStatus>.broadcast();
  Stream<LocationStatus> get locationStream => _locationStreamController.stream;

  @override
  void onInit() {
    super.onInit();
    checkLocationStatus(); // Changed to public method
  }

  Future<void> checkLocationStatus() async {  // Changed from private to public
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled && locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }

  @override
  void onClose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.onClose();
  }
}
