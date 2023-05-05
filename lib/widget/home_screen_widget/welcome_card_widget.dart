import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fish/fish_bloc.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../model/user_model.dart';
import '../../utils/notification_utils.dart';
import '../../utils/schedulled_notif.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: context.read<UserBloc>(),
      builder: (context, state) {
        if (state is UserLoading) {
          return const CircularProgressIndicator();
        } else if (state is UserLoaded) {
          User userData = state.user;
          return Card(
            margin: const EdgeInsets.all(10),
            color: Colors.green[100],
            shadowColor: Colors.blueGrey,
            elevation: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.account_circle,
                    color: Colors.cyan,
                    size: 60,
                  ),
                  title: const Text(
                    'Selamat Datang',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(' ${userData.name ?? 'User'}'),
                  trailing: CircleAvatar(
                    child: BlocBuilder<FishBloc, FishState>(
                      bloc: context.read<FishBloc>(),
                      builder: (context, state) {
                        if (state is FishLoadSuccess) {
                          final fish = state.fish;
                          return IconButton(
                            onPressed: () {
                              permission();
                              scheduleNotification(fish);
                            },
                            icon: const Icon(Icons.notification_add_outlined),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('FATAL ERROR (WELCOME CARD)');
        }
      },
    );
  }
}
