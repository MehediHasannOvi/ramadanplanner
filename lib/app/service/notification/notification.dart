import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:isolate';

import 'package:hive_flutter/adapters.dart';
import 'package:ramadanplanner/Util/app_colors.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        defaultPresentAlert: true,
        defaultPresentBadge: true,
        defaultPresentSound: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          'channelId',
          'channelName',
          importance: Importance.max,
          priority: Priority.high,
          visibility: NotificationVisibility.public,
          color: AppColors.primaryColor,
          playSound: true,
          enableVibration: true,
          icon: 'flutter_logo',
          fullScreenIntent: true,
          showWhen: true,
          showProgress: true,
          ledColor: Colors.red,
          ledOnMs: 1000,
          ledOffMs: 500,
          autoCancel: true,
        ),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  Future scheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    return notificationsPlugin.zonedSchedule(
        id, title, body, nextInstanceOfOneAm(), await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}

tz.TZDateTime nextInstanceOfOneAm() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, 6); // 1 am
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  print("This is tha Time is notifi ${scheduledDate}");

  return scheduledDate;
}











// class NotificationServices {
//   static Future<void> initializeNotification() async {
//     await AwesomeNotifications().initialize(
//         null,
//         [
//           NotificationChannel(
//             channelKey: 'high_importance_channel',
//             channelGroupKey: 'High Importance Notifications',
//             channelName: 'basic Notification',
//             channelDescription: 'Notification channel for basic tests',
//             defaultColor: AppColors.primaryColor,
//             ledColor: AppColors.primaryColor,
//             channelShowBadge: true,
//             onlyAlertOnce: true,
//             playSound: true,
//             enableLights: true,
//             enableVibration: true,
//             criticalAlerts: true,
//           )
//         ],
//         channelGroups: [
//           NotificationChannelGroup(
//             channelGroupName: 'group1',
//             channelGroupKey: 'High Importance Notifications',
//           ),
//         ],
//         debug: true);
//     await AwesomeNotifications().isNotificationAllowed().then(
//       (isAllowed) async {
//         if (!isAllowed) {
//           await AwesomeNotifications().requestPermissionToSendNotifications();
//         }
//       },
//     );
//     await AwesomeNotifications().setListeners(
//       onActionReceivedMethod: onActionReceivedMethod,
//       onNotificationDisplayedMethod: onNotificationDisplayedMethod,
//       onDismissActionReceivedMethod: onDismissActionReceivedMethod,
//       onNotificationCreatedMethod: onNotificationCreatedMethod,
    
//     );
//   }
//   static Future <void> onNotificationCreatedMethod ( ReceivedNotification receivedNotification) async {
//     print('Notification Created');
//   }

//   static Future <void> onNotificationDisplayedMethod ( ReceivedNotification receivedNotification) async {
//     print('Notification Created');
//   }

//   static Future <void> onDismissActionReceivedMethod ( ReceivedAction receivedAction) async {
//     print('Notification Created');
//   }

//   static Future <void> onActionReceivedMethod ( ReceivedAction receivedAction) async {
//     print('Notification Created');
//     final payload = receivedAction.payload ?? {};
//     if (payload['navigate'] == 'true') {
//       Get.toNamed(Routes.PRAY_TRACKER);
//     }

//   }

//   static Future<void> showNotification({
//    required final String title,
//    required final String body,
//    final String? summary,
//    final Map<String, String>? payload,
//    final ActionType actionType = ActionType.Default,
//    final NotificationLayout notificationLayout = NotificationLayout.Default,
//    final NotificationCategory? category,
//    final String? bigPicture,
//    final List<NotificationActionButton>? actionButtons,
//    final bool schedule = false,
//    final int? interval,
//   //  final bool isrepeat = false,
//   })async{
//     assert (!schedule || (schedule != null));
//     await AwesomeNotifications().createNotification(content: 
//     NotificationContent(
//       id: -1,
//       channelKey: 'high_importance_channel',
//       title: title,
//       body: body,
//       notificationLayout: notificationLayout,
//       summary: summary,
//       actionType: actionType,
//       payload: payload,
//       displayOnForeground: true,
//       displayOnBackground: true,
//       fullScreenIntent: true,
//       category: category,
//       bigPicture: bigPicture,
//       backgroundColor: AppColors.primaryColor,
//       badge: 1,
      
//     ),
//     actionButtons: actionButtons,
//     schedule: schedule ? NotificationInterval(
//       timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
//       // repeats: true,
//       interval: nextInstanceOfOneAm().minute,
//       preciseAlarm: true,
//       // repeats: isrepeat,
      
//     ) : null,

    
//     );
//   }

// }


// // triggerNotification(
// //     String titel, String body, dynamic schedule, bool isRepeat) {
// //   AwesomeNotifications().createNotification(
// //     content: NotificationContent(
// //       // customSound: "assets/sound/notification.mp3",
// //       id: 10,
// //       channelKey: 'basic_channel',
// //       title: titel,
// //       body: body,
// //       notificationLayout: NotificationLayout.BigText,
// //       // icon: "assets/images/logo.png",
// //       backgroundColor: AppColors.primaryColor,
// //       badge: 1,
// //       displayOnForeground: true,
// //       displayOnBackground: true,
// //       fullScreenIntent: true,
// //     ),
   
// //   // );
// //   schedule: NotificationCalendar(
// //     timeZone: DateTime.now().timeZoneName,
// //     repeats: isRepeat,
   
// //   ));
// // }


