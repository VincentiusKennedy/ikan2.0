// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proto_ikan/bloc/fish_list/fish_list_bloc.dart';
import 'package:proto_ikan/bloc/user_bloc/user_bloc.dart';
import 'package:proto_ikan/widget/home_screen_widget/welcome_card_widget.dart';
import 'package:proto_ikan/widget/jadwal_screen_widget/jadwal_list_widget.dart';

class JadwalScreen extends StatefulWidget {
  const JadwalScreen({Key? key}) : super(key: key);

  @override
  State<JadwalScreen> createState() => _JadwalScreen();
}

class _JadwalScreen extends State<JadwalScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FishListBloc>().add(GetFishList());
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
