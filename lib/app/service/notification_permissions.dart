 
 // notification permission request method for mobile platform 
 
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      final status = await Permission.notification.status;
      if (status.isDenied) {
        final result = await Permission.notification.request();
        if (result.isDenied) {
          Get.snackbar(
            'Permission Denied',
            'Notification permissions are required to receive notifications.',
            snackPosition: SnackPosition.TOP,
          );
        } else if (result.isPermanentlyDenied) {
          Get.snackbar(
            'Permission Required',
            'Notification permissions are required. Please enable them in app settings.',
            snackPosition: SnackPosition.TOP,
          );
          openAppSettings();
        }
      } else if (status.isPermanentlyDenied) {
        Get.snackbar(
          'Permission Required',
          'Notification permissions are required. Please enable them in app settings.',
          snackPosition: SnackPosition.TOP,
        );
        openAppSettings();
      }
    } else if (Platform.isIOS) {
      final status = await Permission.notification.status;
      if (!status.isGranted) {
        await Permission.notification.request();
      }
    }
  }