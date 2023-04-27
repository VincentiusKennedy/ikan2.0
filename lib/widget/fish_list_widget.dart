import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_ikan/bloc/fish_list/fish_list_bloc.dart';

class FishListWidget extends StatelessWidget {
  const FishListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FishListBloc, FishListState>(
      bloc: context.read<FishListBloc>(),
      builder: (context, state) {
        if (state is FishListLoading) {
          return const CircularProgressIndicator();
        } else if (state is FishListLoadSuccess) {
          final fishList = state.fishList;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: fishList.length,
            itemBuilder: ((context, index) {
              final fish = fishList[index];
              return Card(
                child: Column(
                  children: [Text(fish.title)],
                ),
              );
            }),
          );
        } else {
          return const Text('FATAL ERROR (FISH LIST)');
        }
      },
    );
  }
}
