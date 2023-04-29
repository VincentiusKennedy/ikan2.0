import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_ikan/bloc/auth_bloc/auth_bloc.dart';
import 'package:proto_ikan/bloc/user_bloc/user_bloc.dart';
import 'package:proto_ikan/model/user_model.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<UserBloc, UserState>(
        bloc: context.read<UserBloc>(),
        builder: (context, state) {
          if (state is UserLoading) {
            return const CircularProgressIndicator();
          } else if (state is UserLoaded) {
            User userData = state.user;
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('${userData.name}'),
                  accountEmail: Text("${userData.email}"),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1533227268428-f9ed0900fb3b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1158&q=80"),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text("Logout"),
                  subtitle: const Text("Keluar dari akun anda"),
                  trailing: const Icon(Icons.logout),
                  onTap: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
                  },
                ),
              ],
            );
          } else {
            return Container(
              child: const Text('ERROR'),
            );
          }
        },
      ),
    );
  }
}
