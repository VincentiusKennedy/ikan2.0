import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/user_bloc/user_bloc.dart';
import '../repository/login_repositories.dart';
import '../widget/login_widget.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;
  const LoginScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('LOGIN AKUN ANDA')),
      ),
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
            userBloc: BlocProvider.of<UserBloc>(context),
          );
        },
        child: LoginWidget(userRepository: userRepository),
      ),
    );
  }
}
