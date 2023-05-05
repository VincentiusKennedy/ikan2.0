import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fish/fish_bloc.dart';

class FishDetailWidget extends StatelessWidget {
  const FishDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<FishBloc>().add(GetFish());
        return true;
      },
      child: BlocBuilder<FishBloc, FishState>(
        bloc: context.read<FishBloc>(),
        builder: (context, state) {
          if (state is FishLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FishLoadSuccess) {
            final fishDetail = state.fish[0];
            return Column(
              children: [
                Text(fishDetail.description[0].berat),
              ],
            );
          } else {
            return const Text('FATAL ERROR (DETAIL FISH)');
          }
        },
      ),
    );
  }
}
