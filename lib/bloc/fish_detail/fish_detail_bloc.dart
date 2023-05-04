// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:proto_ikan/model/fish_detail_model.dart';
// import 'package:proto_ikan/repository/fish_detail_repository.dart';

// part 'fish_detail_event.dart';
// part 'fish_detail_state.dart';

// class FishDetailBloc extends Bloc<FishDetailEvent, FishDetailState> {
//   final FishDetailRepository fishDetailRepository;

//   FishDetailBloc({required this.fishDetailRepository})
//       : super(FishDetailInitial()) {
//     on<GetFishDetail>((event, emit) async {
//       emit(FishDetailLoading());
//       try {
//         final fishDetail = await fishDetailRepository
//             .getFishDetail(); // print(fishList);
//         emit(FishDetailLoadSuccess(fishDetail));
//       } catch (error) {
//         emit(FishDetailLoadFailure(error: error.toString()));
//       }
//     });
//   }
// }
