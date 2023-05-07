import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../utils/notification_utils.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KELOLA AKUN ANDA'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: _buildTestNotifButton(),
      ),
    );
  }
}

Widget _buildTestNotifButton() {
  return const ElevatedButton(
    onPressed: postNotification,
    child: Text('TEST'),
  );
}
