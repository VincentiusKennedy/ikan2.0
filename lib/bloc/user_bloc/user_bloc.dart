import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proto_ikan/model/user_model.dart';
import 'package:proto_ikan/repository/login_repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<GettingUser>((event, emit) async {
      emit(UserLoading());
      emit(UserLoaded(event.user));
    });
  }
}
