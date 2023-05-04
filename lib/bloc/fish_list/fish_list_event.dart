// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fish_list_bloc.dart';

abstract class FishListEvent extends Equatable {
  const FishListEvent();

  @override
  List<Object> get props => [];
}

class GetFishList extends FishListEvent {}

class GetFishDetail extends FishListEvent {
  final String id;

  GetFishDetail({
    required this.id,
  });
}
