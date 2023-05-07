import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fish/fish_bloc.dart';

class FishDetailWidget extends StatelessWidget {
  const FishDetailWidget({Key? key});

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
                Image.network(fishDetail.picture),
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            fishDetail.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            fishDetail.status,
                            style: const TextStyle(color: Colors.lightGreen),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text('Harga Dasar: Rp.${fishDetail.price} / Kg'),
                      Text(fishDetail.location),
                      Text(fishDetail.date),
                      const SizedBox(height: 12.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Deskripsi Produk',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('Kondisi : ${fishDetail.description[0].kondisi}'),
                      Text('Ukuran : ${fishDetail.description[0].ukuran} Cm'),
                      Text('Berat : ${fishDetail.description[0].berat} Kg'),
                      Text(
                          'Jenis Potongan : ${fishDetail.description[0].kondisi}'),
                      const SizedBox(height: 12.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Deskripsi Harga',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildRichText(
                        'Harga Dasar : ',
                        'Rp.${fishDetail.description[0].hargaDasar}',
                      ),
                      _buildRichText(
                        'Quantity : ',
                        '${fishDetail.description[0].quantity} Kg',
                      ),
                      _buildRichText(
                        'Total Harga : ',
                        'Rp.${fishDetail.description[0].totalHarga}',
                      ),
                      _buildRichText(
                        'Kelipatan : ',
                        'Rp.${fishDetail.description[0].kelipatan}',
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Text('FATAL ERROR (DETAIL FISH)');
          }
        },
      ),
    );
  }

  RichText _buildRichText(String label, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
