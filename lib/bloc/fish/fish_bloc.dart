import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/fish_list_model.dart';
import '../../repository/fish_repositories.dart';
import '../../utils/schedulled_notif.dart';

part 'fish_event.dart';
part 'fish_state.dart';

class FishBloc extends Bloc<FishEvent, FishState> {
  final FishRepository fishRepository;

  FishBloc({required this.fishRepository}) : super(FishInitial()) {
    on<GetFish>((event, emit) async {
      emit(FishLoading());
      try {
        final fish = await fishRepository.getFishData();
        // print(fish);
        scheduleNotification(fish);
        emit(FishLoadSuccess(fish));
      } catch (error) {
        emit(FishLoadFailure(error: error.toString()));
      }
    });

    on<GetFishDetail>((event, emit) async {
      emit(FishLoading());
      try {
        final fishDetail = await fishRepository.getFishDetail(event.id);
        emit(FishLoadSuccess(fishDetail));
      } catch (error) {
        emit(FishLoadFailure(error: error.toString()));
      }
    });
  }
}
