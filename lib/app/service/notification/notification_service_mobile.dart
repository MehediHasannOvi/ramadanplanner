// lib/app/service/notification/notification_service_mobile.dart

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:ramadan_planner/app/routes/app_pages.dart';
import 'package:ramadan_planner/app/service/notification_permissions.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

   final notificationPermissions = requestPermissions();

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    tz.initializeTimeZones();

    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');


   // request notification permission
    await notificationPermissions;

    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      // onDidReceiveLocalNotification:
      //     (int id, String? title, String? body, String? payload) async {},
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        Get.offNamed(Routes.DAILY_TRACKING);
      },
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'channelId',
      'channelName',
      importance: Importance.max,
      enableLights: true,
      playSound: true,
      enableVibration: true,
      ledColor: Colors.red,
    );

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(channel);
  }

 

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
        visibility: NotificationVisibility.public,
        color: Colors.green,
        playSound: true,
        enableVibration: true,
        icon: '@mipmap/ic_launcher',
        fullScreenIntent: true,
        showWhen: true,
        showProgress: true,
        ledColor: Colors.red,
        ledOnMs: 1000,
        ledOffMs: 500,
        autoCancel: true,
        enableLights: true,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationsPlugin.show(id, title, body, notificationDetails());
  }

  Future<void> scheduleNotification({
    int id = 0,
    String? title,
    String? body,
    int? hour,
    int? minute,
    String? payLoad,
  }) async {
    return notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      nextInstanceOfOneAm(hour!, minute!),
      notificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> dalyscheduleNotifications({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
    required List<Map<String, int>> timeSlots,
  }) async {
    for (var timeSlot in timeSlots) {
      int hour = timeSlot['hour']!;
      int minute = timeSlot['minute']!;

      await notificationsPlugin.zonedSchedule(
        id++,
        title,
        body,
        payload: payLoad,
        nextInstanceOfOneAm(hour, minute),
        notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    }

    print("Notification Scheduled ${nextInstanceOfOneAm(6, 0)})}");
  }

  tz.TZDateTime nextInstanceOfOneAm(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    print("Notification Scheduled $scheduledDate");
    return scheduledDate;
  }
}