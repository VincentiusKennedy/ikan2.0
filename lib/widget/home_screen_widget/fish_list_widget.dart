import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';

import '../../bloc/fish/fish_bloc.dart';
import '../../screen/bottom_nav_bar_screen.dart';

class FishWidget extends StatelessWidget {
  const FishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FishBloc, FishState>(
      bloc: context.read<FishBloc>(),
      builder: (context, state) {
        if (state is FishLoading) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(color: Colors.white),
                child: SkeletonItem(
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: double.infinity,
                          minHeight: MediaQuery.of(context).size.height / 8,
                          maxHeight: MediaQuery.of(context).size.height / 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is FishLoadSuccess) {
          final fishList = state.fish;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: fishList.length,
            itemBuilder: ((context, index) {
              final fishes = fishList[index];
              return Card(
                margin: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInImage(
                        placeholder: const AssetImage('assets/Placeholder.png'),
                        image: NetworkImage(fishes.picture),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            fishes.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            fishes.status,
                            style: const TextStyle(
                              color: Colors.lightGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const BottomNavBarScreen(indexScreen: 1),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 114, 155, 194)),
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 48.0)),
                          ),
                          child: const Text(
                            'Lihat Jadwal',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        } else {
          return const Text('OWENGOWENGOWENGWOAODJWAOIDHIOAUWSDJHBIAOUWD');
        }
      },
    );
  }
}
