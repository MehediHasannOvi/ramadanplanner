import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import '../Util/app_colors.dart';
import '../app/routes/app_pages.dart';

class NotificationServices {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelKey: 'high_importance_channel',
            channelGroupKey: 'High Importance Notifications',
            channelName: 'basic Notification',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: AppColors.primaryColor,
            ledColor: AppColors.primaryColor,
            channelShowBadge: true,
            onlyAlertOnce: true,
            playSound: true,
            enableLights: true,
            enableVibration: true,
            criticalAlerts: true,
          )
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupName: 'group1',
            channelGroupKey: 'High Importance Notifications',
          ),
        ],
        debug: true);
    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) async {
        if (!isAllowed) {
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
    
    );
  }
  static Future <void> onNotificationCreatedMethod ( ReceivedNotification receivedNotification) async {
    print('Notification Created');
  }

  static Future <void> onNotificationDisplayedMethod ( ReceivedNotification receivedNotification) async {
    print('Notification Created');
  }

  static Future <void> onDismissActionReceivedMethod ( ReceivedAction receivedAction) async {
    print('Notification Created');
  }

  static Future <void> onActionReceivedMethod ( ReceivedAction receivedAction) async {
    print('Notification Created');
    final payload = receivedAction.payload ?? {};
    if (payload['navigate'] == 'true') {
      Get.toNamed(Routes.PRAY_TRACKER);
    }

  }

  static Future<void> showNotification({
   required final String title,
   required final String body,
   final String? summary,
   final Map<String, String>? payload,
   final ActionType actionType = ActionType.Default,
   final NotificationLayout notificationLayout = NotificationLayout.Default,
   final NotificationCategory? category,
   final String? bigPicture,
   final List<NotificationActionButton>? actionButtons,
   final bool schedule = false,
   final int? interval,
  })async{
    assert (!schedule || (schedule && interval != null));
    await AwesomeNotifications().createNotification(content: 
    NotificationContent(
      id: -1,
      channelKey: 'high_importance_channel',
      title: title,
      body: body,
      notificationLayout: notificationLayout,
      summary: summary,
      actionType: actionType,
      payload: payload,
      displayOnForeground: true,
      displayOnBackground: true,
      fullScreenIntent: true,
      category: category,
      bigPicture: bigPicture,
      backgroundColor: AppColors.primaryColor,
      badge: 1,
    ),
    actionButtons: actionButtons,
    schedule: schedule ? NotificationInterval(
      timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
      // repeats: true,
      interval: interval,
      preciseAlarm: true,
    ) : null,
    );
  }

}


// triggerNotification(
//     String titel, String body, dynamic schedule, bool isRepeat) {
//   AwesomeNotifications().createNotification(
//     content: NotificationContent(
//       // customSound: "assets/sound/notification.mp3",
//       id: 10,
//       channelKey: 'basic_channel',
//       title: titel,
//       body: body,
//       notificationLayout: NotificationLayout.BigText,
//       // icon: "assets/images/logo.png",
//       backgroundColor: AppColors.primaryColor,
//       badge: 1,
//       displayOnForeground: true,
//       displayOnBackground: true,
//       fullScreenIntent: true,
//     ),
   
//   // );
//   schedule: NotificationCalendar(
//     timeZone: DateTime.now().timeZoneName,
//     repeats: isRepeat,
//     hour: 0,
//     minute: 1,
//     second: 5,
//   ));
// }


