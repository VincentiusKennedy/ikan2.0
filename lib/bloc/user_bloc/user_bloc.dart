import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import '../../repository/login_repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  late SharedPreferences prefs;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    // inisialisasi prefs saat pembuatan instance UserBloc
    _initPrefs();

    on<GetUser>((event, emit) {
      emit(UserLoading());
      try {
        final userDataString = prefs.getString('userData');
        if (userDataString != null) {
          final userDataJson = jsonDecode(userDataString);
          final userData = User.fromJson(userDataJson);
          emit(UserLoaded(userData));
        } else {
          emit(UserEmpty());
        }
      } catch (e) {
        emit(UserError('Error: $e'));
      }
    });

    on<SaveUser>((event, emit) async {
      emit(UserLoading());
      try {
        await prefs.setString('userData', jsonEncode(event.user.toJson()));
        emit(UserLoaded(event.user));
      } catch (e) {
        emit(UserError('Error: $e'));
      }
    });

    on<ClearUser>((event, emit) async {
      emit(UserLoading());
      try {
        await prefs.remove('userData');
        emit(UserEmpty());
      } catch (e) {
        emit(UserError('Error: $e'));
      }
    });
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
