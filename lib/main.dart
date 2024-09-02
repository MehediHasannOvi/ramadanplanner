// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ramadanplanner/app/modules/navigationbar/views/navigationbar_view.dart';
import 'package:ramadanplanner/app/service/notification/firebasenotification.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'Util/app_colors.dart';
import 'app/data/hivaData.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app/service/notification/notification.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await FlutterBackgroundService.initialize(onStart);

  await hiveData();
// Initialize NotificationService
  
  tz.initializeTimeZones(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
   FirebaseNotificationService().initialize();
   await NotificationService().init();
  // Register background message handler
  FirebaseMessaging.onBackgroundMessage(FirebaseNotificationService.backgroundMessageHandler);


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
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: "Ramadan Planner",
          // home: const NavigationbarView(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            scaffoldBackgroundColor: AppColors.primaryColor,
            primarySwatch: Colors.green,
          ),
           defaultTransition: Transition.noTransition, 
        );
      },
    );
  }
}


