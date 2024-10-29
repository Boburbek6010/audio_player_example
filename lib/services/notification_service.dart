import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationService(this.flutterLocalNotificationsPlugin);

  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'audio_service_channel',
      'Audio Service Notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}
