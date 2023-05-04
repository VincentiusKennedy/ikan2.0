import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_ikan/bloc/fish_list/fish_list_bloc.dart';

class FishDetailWidget extends StatelessWidget {
  const FishDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FishListBloc, FishListState>(
      bloc: context.read<FishListBloc>(),
      builder: (context, state) {
        if (state is FishDetailLoading) {
          return CircularProgressIndicator();
        } else if (state is FishDetailLoadSuccess) {
          final fishDetail = state.fishDetail[0];
          return Column(
            children: [
              Text(fishDetail.berat),
            ],
          );
        } else {
          return Text('FATAL ERROR (DETAIL FISH)');
        }
      },
    );
  }
}
