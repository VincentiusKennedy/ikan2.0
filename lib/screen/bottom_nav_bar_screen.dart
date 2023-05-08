import 'package:flutter/material.dart';
import 'package:proto_ikan/screen/main_screen/history_screen.dart';

import 'main_screen/account_screen.dart';
import 'main_screen/home_screen.dart';
import 'main_screen/jadwal_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  final int indexScreen;

  const BottomNavBarScreen({required this.indexScreen, super.key});

  @override
  State<BottomNavBarScreen> createState() =>
      _BottomNavBarScreenState(bottomNavIndex: indexScreen);
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int bottomNavIndex;
  _BottomNavBarScreenState({required this.bottomNavIndex});

  final List<Widget> _listWidget = [
    const HomePage(),
    const JadwalScreen(),
    HistoryScreen(),
    const AccountScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.schedule_outlined),
      label: 'Jadwal',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.history_outlined),
      label: 'Riwayat',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.manage_accounts_outlined),
      label: 'Akun',
    ),
  ];

  void _onBottomNavBarTapped(int index) {
    setState(() {
      bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavBarTapped,
      ),
    );
  }
}
