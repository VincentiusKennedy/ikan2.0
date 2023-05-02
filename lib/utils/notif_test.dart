import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

Future<void> postNotification() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'default_notification_channel_id',
    'Default',
    importance: Importance.max,
    priority: Priority.max,
  );
  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(0, 'PROTO IKAN',
      'Anda telah mengaktifkan notifikasi', notificationDetails);
}
