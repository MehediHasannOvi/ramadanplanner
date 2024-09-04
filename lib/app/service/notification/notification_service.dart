// lib/app/service/notification/notification_service.dart
import 'package:flutter/foundation.dart';

export 'notification_service_mobile.dart'
    if (kIsWeb) 'notification_service_web.dart';