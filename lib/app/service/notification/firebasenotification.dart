import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:ramadanplanner/app/routes/app_pages.dart';

class FirebaseNotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Singleton pattern
  static final FirebaseNotificationService _instance = FirebaseNotificationService._internal();
  factory FirebaseNotificationService() => _instance;
  FirebaseNotificationService._internal();

  // Initialize the service
  Future<void> initialize() async {
    await Firebase.initializeApp();
    _initializeLocalNotifications();
    _setupFirebaseMessaging();
  }

  // Initialize local notifications
  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: _onSelectNotification,
    );
  }

  // Show a local notification
  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      // 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await _localNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      platformDetails,
      payload: message.data['screen'],
    );
  }

  // Handle notification taps
  Future<void> _onSelectNotification(String? payload) async {
    if (payload != null) {
      if (payload == 'DailyTrackingView') {
         Get.toNamed(Routes.DAILY_TRACKING);
      } 
      // else if (payload == 'SomeOtherView') {
      //   // Get.to(SomeOtherView());
      // }
    }
  }

  // Setup Firebase messaging listeners
  void _setupFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _onSelectNotification(message.data['screen']);
    });

    _messaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _onSelectNotification(message.data['screen']);
      }
    });
  }

  void requestNotificationPermissions() {
  FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
}

  // Background message handler
  static Future<void> backgroundMessageHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    _instance._showNotification(message);
  }
}
