part of 'fish_list_bloc.dart';

abstract class FishListEvent extends Equatable {
  const FishListEvent();

  @override
  List<Object> get props => [];
}

class GetFishList extends FishListEvent {}
