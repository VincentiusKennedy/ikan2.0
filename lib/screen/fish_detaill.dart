import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_ikan/bloc/fish_list/fish_list_bloc.dart';
import 'package:proto_ikan/widget/fish_detail_screen_widget/fish_detail_widget.dart';

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
    context.read<FishListBloc>().add(GetFishDetail(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kembali'),
      ),
      body: SingleChildScrollView(
        child: FishDetailWidget(),
      ),
    );
  }
}
