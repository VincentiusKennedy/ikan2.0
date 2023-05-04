import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_ikan/bloc/fish_list/fish_list_bloc.dart';
import 'package:proto_ikan/screen/fish_detaill.dart';
import 'package:skeletons/skeletons.dart';

class JadwalWidget extends StatelessWidget {
  const JadwalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FishListBloc, FishListState>(
      bloc: context.read<FishListBloc>(),
      builder: (context, state) {
        if (state is FishListLoading) {
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
        } else if (state is FishListLoadSuccess) {
          final fishList = state.fishList;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: fishList.length,
            itemBuilder: ((context, index) {
              final fish = fishList[index];
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
                        image: NetworkImage(fish.picture),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            fish.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            fish.status.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.lightGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Harga Dasar : RP.${fish.price} / Kg'),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        Text(fish.location)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time_rounded),
                        Text(fish.date),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    FishDetailScreen(id: fish.id),
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
                            'Lihat Produk',
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
