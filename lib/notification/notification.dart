import 'package:awesome_notifications/awesome_notifications.dart';
import '../Util/app_colors.dart';

triggerNotification(String titel, String body) {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      // customSound: "assets/sound/notification.mp3",
      id: 10,
      channelKey: 'basic_channel',
      title: titel,
      body: body,
      notificationLayout: NotificationLayout.BigText,
      // icon: "assets/images/logo.png",
      backgroundColor: AppColors.primaryColor,
      badge: 1,
      displayOnForeground: true,
      displayOnBackground: true,
      fullScreenIntent: true,

    ),
  );
}
