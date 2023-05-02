import 'package:flutter/material.dart';
import 'package:proto_ikan/utils/notification_utils.dart';

class NotificationTestWidget extends StatelessWidget {
  const NotificationTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: postNotification,
      child: Text('TEST'),
    );
  }
}
