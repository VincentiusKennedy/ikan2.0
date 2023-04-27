import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proto_ikan/model/fish_list_model.dart';
import 'package:proto_ikan/repository/fish_list_repositories.dart';

part 'fish_list_event.dart';
part 'fish_list_state.dart';

class FishListBloc extends Bloc<FishListEvent, FishListState> {
  final FishListRepository fishListRepository;

  FishListBloc({required this.fishListRepository}) : super(FishListInitial()) {
    on<GetFishList>((event, emit) async {
      emit(FishListLoading());
      try {
        final fishList = await fishListRepository.getFishListData();
        print(fishList);
        emit(FishListLoadSuccess(fishList));
      } catch (error) {
        emit(FishListLoadFailure(error: error.toString()));
      }
    });
  }
}
