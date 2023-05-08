import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_ikan/widget/fish_detail_screen_widget/dialog_widget.dart';

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
                  builder: (BuildContext context) => DialogWidget(),
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
