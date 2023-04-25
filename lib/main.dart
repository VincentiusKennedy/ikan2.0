import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_ikan/bloc/auth_bloc/auth_bloc.dart';
import 'package:proto_ikan/bloc/user_bloc/user_bloc.dart';
import 'package:proto_ikan/model/user_model.dart';
import 'package:proto_ikan/repository/repositories.dart';
import 'package:proto_ikan/screen/login_screen.dart';
import 'package:proto_ikan/screen/main_screen.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  final userRepository = UserRepository();
  final user = User();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(userRepository: userRepository)
              ..add(AppStarted());
          },
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(user, userRepository),
        ),
      ],
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('mn', 'MN'),
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return const MainScreen();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginScreen(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      strokeWidth: 4.0,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
