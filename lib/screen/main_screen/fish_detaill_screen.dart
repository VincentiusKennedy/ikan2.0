import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/fish/fish_bloc.dart';
import '../../widget/fish_detail_screen_widget/fish_detail_widget.dart';

class FishDetailScreen extends StatefulWidget {
  final String id;
  const FishDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<FishDetailScreen> createState() => _FishDetailScreen(id: id);
}

class _FishDetailScreen extends State<FishDetailScreen> {
  final String id;

  _FishDetailScreen({required this.id});
  @override
  void initState() {
    super.initState();
    context.read<FishBloc>().add(GetFishDetail(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kembali'),
      ),
      body: const SingleChildScrollView(
        child: FishDetailWidget(),
      ),
      bottomSheet: Builder(
        builder: (context) => _buildBottomSheet(context, id),
      ),
    );
  }
}

Widget _buildBottomSheet(BuildContext context, String id) {
  return Container(
    color: const Color.fromARGB(255, 201, 197, 197),
    child: FractionallySizedBox(
      widthFactor: 1,
      child: SizedBox(
        height: 80,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(
                16.0), // atur jarak antara TextButton dengan SizedBox
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildDialog(context),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 18, 124, 223)),
                minimumSize: MaterialStateProperty.all(
                  const Size(double.infinity, 48.0),
                ),
              ),
              child: const Text(
                'Daftar Lelang',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildDialog(BuildContext context) {
  String textFieldValue = '';
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    content: Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Daftar Lelang',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Harga Deposit'),
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              textFieldValue = value;
            },
            decoration: const InputDecoration(
              hintText: 'Harga Deposit',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
              'Salam, terima kasih telah berminat untuk bergabung dalam lelang kami. Untuk Harga depositnya sebesar 1 Juta Rupiah, Apakah anda ingin Melanjutkan Pendaftaran?'),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print(textFieldValue);
                  Navigator.of(context).pop();
                },
                child: const Text('Daftar Lelang'),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
