import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proto_ikan/bloc/auth_bloc/auth_bloc.dart';
import 'package:proto_ikan/bloc/user_bloc/user_bloc.dart';
import 'package:proto_ikan/repository/login_repositories.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  final UserBloc userBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
    required this.userBloc,
  }) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final token = await userRepository.login(event.email, event.password);
        authenticationBloc.add(LoggedIn(token: token));
        final user = await userRepository.getUserData(token);
        print('INI DARI LOGIN BLOC ${user.email}');
        userBloc.add(GettingUser(user: user));
        emit(LoginInitial());
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
