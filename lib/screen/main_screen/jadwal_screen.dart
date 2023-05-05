import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fish/fish_bloc.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../widget/home_screen_widget/welcome_card_widget.dart';
import '../../widget/jadwal_screen_widget/jadwal_list_widget.dart';

class JadwalScreen extends StatefulWidget {
  const JadwalScreen({Key? key}) : super(key: key);

  @override
  State<JadwalScreen> createState() => _JadwalScreen();
}

class _JadwalScreen extends State<JadwalScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FishBloc>().add(GetFish());
    context.read<UserBloc>().add(GetUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              WelcomeCard(),
              JadwalWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
