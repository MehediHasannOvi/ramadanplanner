import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ramadanplanner/notification/notification.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'Util/app_colors.dart';
import 'app/modules/fastscreen.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationServices.initializeNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();

  // ReceivedAction? receivedAction = await AwesomeNotifications()
  //     .getInitialNotificationAction(removeFromActionEvents: false);
  // await AwesomeNotifications().initialize(
  //     null,
  //     [
  //       NotificationChannel(
  //         channelKey: 'basic_channel',
  //         channelName: 'Basic notifications',
  //         channelDescription: 'Notification channel for basic tests',
  //         defaultColor: AppColors.primaryColor,
  //         ledColor: AppColors.primaryColor,
  //       ),
  //     ],
  //     debug: true);

// OfflineNotificationService().init();

// Local Data Base
  await Hive.initFlutter();
  await Hive.openBox('daily');
  await Hive.openBox('user');
  await Hive.openBox('Dtrack');
  await Hive.openBox('quranData');

  // Local Data Base
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          title: "Ramadan Planner",
          home: const Fastpage(),
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
    });
  }
}
