part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  UserState(this.data);

  User data;

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  UserInitial(super.data);
}

class UserGet extends UserState {
  UserGet(super.data);
}

class UserNotGet extends UserState {
  UserNotGet(super.data);
}

class UserLoading extends UserState {
  UserLoading(super.data);
}
