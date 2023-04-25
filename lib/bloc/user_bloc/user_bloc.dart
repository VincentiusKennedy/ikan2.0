import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proto_ikan/model/user_model.dart';
import 'package:proto_ikan/repository/repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final User user;
  final UserRepository userRepository;

  UserBloc(this.user, this.userRepository) : super(UserInitial(User())) {
    // on<GettingUser>((event, emit) async {
    // emit(UserGet());
    // await userRepository.getUserData(event.user);
    // });
  }
}
