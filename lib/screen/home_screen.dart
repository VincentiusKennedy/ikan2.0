import 'package:flutter/material.dart';
import 'package:proto_ikan/widget/drawer.dart';
import 'package:proto_ikan/widget/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome!'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.maybeOf(context)?.openDrawer();
                },
              );
            },
          ),
        ),
        drawer: const Drawer(child: DrawerWidget()),
        body: const HomeWidget());
  }
}
