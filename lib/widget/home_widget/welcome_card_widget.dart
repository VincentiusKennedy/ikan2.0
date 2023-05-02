import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_ikan/bloc/fish_list/fish_list_bloc.dart';
import 'package:proto_ikan/bloc/user_bloc/user_bloc.dart';
import 'package:proto_ikan/model/user_model.dart';
import 'package:proto_ikan/utils/notification_utils.dart';
import 'package:proto_ikan/utils/schedulled_notif.dart';

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
                    child: BlocBuilder<FishListBloc, FishListState>(
                      bloc: context.read<FishListBloc>(),
                      builder: (context, state) {
                        if (state is FishListLoadSuccess) {
                          final fishList = state.fishList;
                          return IconButton(
                            onPressed: () {
                              permission();
                              scheduleNotification(fishList);
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
