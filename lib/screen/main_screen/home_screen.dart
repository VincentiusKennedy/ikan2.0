import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fish/fish_bloc.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../widget/drawer.dart';
import '../../widget/home_screen_widget/dashboard_widget.dart';
import '../../widget/home_screen_widget/fish_list_widget.dart';
import '../../widget/home_screen_widget/welcome_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<FishBloc>().add(GetFish());
    context.read<UserBloc>().add(GetUser());
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeCard(),
            const DashboardWidget(),
            _buildText(),
            const FishWidget(),
          ],
        ),
      ),
    );
  }
}

Widget _buildText() {
  return const Padding(
    padding: EdgeInsets.all(12),
    child: Text(
      'Ketersediaan Lelang',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
