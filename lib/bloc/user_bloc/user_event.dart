part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class GetUser extends UserEvent {}

class SaveUser extends UserEvent {
  final User user;

  const SaveUser(this.user);

  @override
  List<Object?> get props => [user];
}

class ClearUser extends UserEvent {}
