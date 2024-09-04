// lib/app/service/notification/notification_service_web.dart
import 'dart:html' as html;

class NotificationService {
  Future<void> initNotification() async {
    // Web-specific initialization
  }

  Future<void> _showWebNotification(String? title, String? body) async {
    if (html.Notification.supported) {
      html.Notification.requestPermission().then((permission) {
        if (permission == 'granted') {
          html.Notification(title ?? 'Notification', body: body ?? '');
        }
      });
    }
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    _showWebNotification(title, body);
  }

  Future<void> scheduleNotification({
    int id = 0,
    String? title,
    String? body,
    int? hour,
    int? minute,
    String? payLoad,
  }) async {
    _showWebNotification(title, body);
  }

  Future<void> dalyscheduleNotifications({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
    required List<Map<String, int>> timeSlots,
  }) async {
    _showWebNotification(title, body);
  }
}
