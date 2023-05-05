part of 'fish_bloc.dart';

abstract class FishState extends Equatable {
  const FishState();

  @override
  List<Object> get props => [];
}

class FishInitial extends FishState {}

class FishLoading extends FishState {}

class FishLoadSuccess extends FishState {
  final List<Fish> fish;

  const FishLoadSuccess(this.fish);
}

class FishLoadFailure extends FishState {
  final String error;

  const FishLoadFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'Failed to load fish {error: $error}';
  }
}
