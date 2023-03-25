import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'Util/app_colors.dart';
import 'app/modules/fastscreen.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ReceivedAction? receivedAction = await AwesomeNotifications().getInitialNotificationAction(
      removeFromActionEvents: false
    );
  await AwesomeNotifications().initialize(
    "assets/images/logo.png",
    
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: AppColors.primaryColor,
        ledColor: AppColors.primaryColor,
      ),
    ],
    debug: true
  );
  await Hive.initFlutter();
   await Hive.openBox('daily');
 await Hive.openBox('user');
 await Hive.openBox('Dtrack');
 await Hive.openBox('quranData');
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
        title: "Application",
        home: Fastpage(),
        // initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
          ),
          
          scaffoldBackgroundColor: AppColors.primaryColor,
          primarySwatch: Colors.green,
        ));
  }));
}
