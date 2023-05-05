part of 'fish_bloc.dart';

abstract class FishEvent extends Equatable {
  const FishEvent();

  @override
  List<Object> get props => [];
}

class GetFish extends FishEvent {}

class GetFishDetail extends FishEvent {
  final String id;

  const GetFishDetail({required this.id});
}
