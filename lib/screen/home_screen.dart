import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_ikan/bloc/fish_list/fish_list_bloc.dart';
import 'package:proto_ikan/bloc/user_bloc/user_bloc.dart';
import 'package:proto_ikan/model/user_model.dart';
import 'package:proto_ikan/widget/drawer.dart';
import 'package:proto_ikan/widget/fish_list_widget.dart';
import 'package:proto_ikan/widget/welcome_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<FishListBloc>().add(GetFishList());
    context.read<UserBloc>().add(GettingUser(user: User()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome!'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.maybeOf(context)?.openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const Drawer(child: DrawerWidget()),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            WelcomeCard(),
            FishListWidget(),
          ],
        ),
      ),
    );
  }
}
