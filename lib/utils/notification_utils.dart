import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proto_ikan/main.dart';

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

Future<void> permission() async {
  final androidInfo = await DeviceInfoPlugin().androidInfo;
  late final Map<Permission, PermissionStatus> statusess;

  if (androidInfo.version.sdkInt <= 32) {
  } else {
    statusess = await [Permission.notification].request();
  }

  var allAccepted = true;
  statusess.forEach((permission, status) {
    if (status != PermissionStatus.granted) {
      allAccepted = false;
    }
  });

  if (allAccepted) {
    postNotification();
  }
}
