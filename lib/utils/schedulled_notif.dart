import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:proto_ikan/main.dart';
import 'package:proto_ikan/model/fish_list_model.dart';

Future<void> scheduleNotification(List<FishList> fishList) async {
  // Initialize timezone data
  tz.initializeTimeZones();

  // Get the local timezone
  final localLocation = tz.getLocation('Asia/Makassar');

  // Get the current time
  final currentTime = tz.TZDateTime.now(localLocation);
  print('INI CURRENT TIME $currentTime');

  for (final fish in fishList) {
    // Parse the scheduled date and time from the FishList object
    final scheduledDate = tz.TZDateTime.parse(localLocation, fish.date);
    print('INI ScheduledDate $scheduledDate');

    // Check if the scheduled time has passed
    if (scheduledDate.isBefore(currentTime)) {
      continue; // Skip this fish if it has already passed
    }

    // Subtract 10 minutes from the scheduled time
    final notificationTime =
        scheduledDate.subtract(const Duration(minutes: 10));

    // Create the notification title and body from the FishList object
    final title = fish.name;
    final body =
        'Lelang ikan ${fish.name} akan dimulai pada ${fish.date} di ${fish.location} dengan harga ${fish.price}';

    print(fish.name);

    // Schedule the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      fish.id.hashCode, // notification ID
      title,
      body,
      notificationTime, // use notificationTime instead of scheduledDate
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          importance: Importance.max,
          priority: Priority.high,
          enableVibration: true,
          playSound: true,
          sound: null,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: fish.id.toString(), // Add a payload for the notification
    );
  }
}
