// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fish_list_bloc.dart';

abstract class FishListState extends Equatable {
  const FishListState();

  @override
  List<Object> get props => [];
}

class FishListInitial extends FishListState {}

class FishListLoading extends FishListState {}

class FishDetailLoading extends FishListState {}

class FishListLoadSuccess extends FishListState {
  final List<FishList> fishList;

  const FishListLoadSuccess(this.fishList);
}

class FishDetailLoadSuccess extends FishListState {
  final List<FishDetail> fishDetail;

  const FishDetailLoadSuccess({required this.fishDetail});
}

class FishListLoadFailure extends FishListState {
  final String error;

  const FishListLoadFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'Failed to load fish {error: $error}';
  }
}

class FishDetailLoadFailure extends FishListState {
  final String error;

  const FishDetailLoadFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'Failed to load fish {error: $error}';
  }
}
