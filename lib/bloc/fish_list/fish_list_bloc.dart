import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:proto_ikan/model/fish_detail_model.dart';
import 'package:proto_ikan/model/fish_list_model.dart';
import 'package:proto_ikan/repository/fish_list_repositories.dart';
import 'package:proto_ikan/utils/schedulled_notif.dart';

part 'fish_list_event.dart';
part 'fish_list_state.dart';

class FishListBloc extends Bloc<FishListEvent, FishListState> {
  final FishListRepository fishListRepository;

  FishListBloc({required this.fishListRepository}) : super(FishListInitial()) {
    on<GetFishList>((event, emit) async {
      emit(FishListLoading());
      try {
        final fishList = await fishListRepository.getFishListData();
        // print(fishList);
        scheduleNotification(fishList);
        emit(FishListLoadSuccess(fishList));
      } catch (error) {
        emit(FishListLoadFailure(error: error.toString()));
      }
    });

    on<GetFishDetail>((event, emit) async {
      emit(FishDetailLoading());
      try {
        final fishDetail = await fishListRepository.getFishDetail(event.id);
        emit(FishDetailLoadSuccess(fishDetail: fishDetail));
      } catch (error) {
        emit(FishListLoadFailure(error: error.toString()));
      }
    });
  }
}
