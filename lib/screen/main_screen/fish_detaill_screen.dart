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
    );
  }
}
