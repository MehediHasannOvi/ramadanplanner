import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ramadanplanner/app/data/dinerkaj.dart';
import 'package:ramadanplanner/app/routes/app_pages.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService extends GetxService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<NotificationService> init() async {
    // Initialize the flutter_local_notifications plugin
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Handle notification tap
        Get.toNamed(Routes.DAILY_TRACKING);
      },
    );

    // Initialize time zone data
    tz.initializeTimeZones();

    // Request notification permissions
    await requestPermissions();

    // Schedule daily notifications
    scheduleDailyNotifications();

    return this;
  }

  Future<void> requestPermissions() async {
    final status = await Permission.notification.status;
    if (status.isDenied) {
      // Request permission
      final result = await Permission.notification.request();
      if (result.isDenied) {
        // Handle the case when permission is denied
        Get.snackbar(
          'Permission Denied',
          'Notification permissions are required to receive notifications.',
          snackPosition: SnackPosition.bottom,
        );
      } else if (result.isPermanentlyDenied) {
        // Handle the case when permission is permanently denied
        Get.snackbar(
          'Permission Required',
          'Notification permissions are required. Please enable them in app settings.',
          snackPosition: SnackPosition.bottom,
        );
        // Redirect to app settings
        openAppSettings();
      }
    } else if (status.isPermanentlyDenied) {
      // Handle the case when permission is permanently denied
      Get.snackbar(
        'Permission Required',
        'Notification permissions are required. Please enable them in app settings.',
        snackPosition: SnackPosition.bottom,
      );
      // Redirect to app settings
      openAppSettings();
    }
  }

  void scheduleDailyNotifications() {
    // Schedule 6 PM notification
    _scheduleNotification(18, 0, 'আস-সালামু আলাইকুম', "আজকের দিনের কাজ \n ${dinerkaj[DateTime.now().day]}");

    // Schedule 8 AM notification
    _scheduleNotification(8, 0, 'আস-সালামু আলাইকুম', "আজকের দিনের কাজ \n ${dinerkaj[DateTime.now().day]}");
  }

  void _scheduleNotification(int hour, int minute, String title, String body) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    final tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduledDate.isBefore(now)
          ? scheduledDate.add(const Duration(days: 1))
          : scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      matchDateTimeComponents: DateTimeComponents.time, // Repeat daily
    );
  }
}
