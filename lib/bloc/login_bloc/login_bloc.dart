import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/login_repositories.dart';
import '../auth_bloc/auth_bloc.dart';
import '../user_bloc/user_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  final UserBloc userBloc;
  late SharedPreferences prefs;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
    required this.userBloc,
  }) : super(LoginInitial()) {
    // inisialisasi prefs saat pembuatan instance LoginBloc
    _initPrefs();
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final token = await userRepository.login(event.email, event.password);
        authenticationBloc.add(LoggedIn(token: token));
        final user = await userRepository.getUserData(token);
        print('INI DARI LOGIN BLOC ${user.email}');
        userBloc.add(SaveUser(user));
        emit(LoginInitial());
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
