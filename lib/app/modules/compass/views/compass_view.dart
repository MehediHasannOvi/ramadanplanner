import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:ramadanplanner/app/modules/compass/views/compass_widget.dart';
import 'package:ramadanplanner/app/modules/compass/views/locationerrorwidget.dart';

import '../controllers/compass_controller.dart';

class CompassView extends GetView<CompassController> {
  const CompassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CompassView'),
        centerTitle: true,
      ),
      body: GetBuilder<CompassController>(
        init: CompassController(),
        initState: (_) {},
        builder: (_) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<CompassController>(
              builder: (controller) {
                return StreamBuilder<LocationStatus>(
                  stream: controller.locationStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.data?.enabled == true) {
                      switch (snapshot.data?.status) {
                        case LocationPermission.always:
                        case LocationPermission.whileInUse:
                          return QiblahCompassWidget();
                        case LocationPermission.denied:
                          return LocationErrorWidget(
                            error: "Location service permission denied",
                            callback: controller.checkLocationStatus,
                          );
                        case LocationPermission.deniedForever:
                          return LocationErrorWidget(
                            error: "Location service Denied Forever!",
                            callback: controller.checkLocationStatus,
                          );
                        default:
                          return const SizedBox();
                      }
                    } else {
                      return LocationErrorWidget(
                        error: "Please enable Location service",
                        callback: controller.checkLocationStatus,
                      );
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
