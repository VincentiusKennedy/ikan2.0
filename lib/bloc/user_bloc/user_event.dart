part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GettingUser extends UserEvent {
  final User user;

  const GettingUser({required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() {
    return 'USER TELAH LOGIN { nama anda adalah ${user.name} }';
  }
}
