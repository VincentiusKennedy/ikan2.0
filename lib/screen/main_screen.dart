import 'package:flutter/material.dart';
import 'package:proto_ikan/screen/account_screen.dart';
import 'package:proto_ikan/screen/home_screen.dart';
import 'package:proto_ikan/screen/jadwal_screen.dart';

class MainScreen extends StatefulWidget {
  final int indexScreen;

  const MainScreen({required this.indexScreen, super.key});

  @override
  State<MainScreen> createState() =>
      _MainScreenState(bottomNavIndex: indexScreen);
}

class _MainScreenState extends State<MainScreen> {
  int bottomNavIndex;
  _MainScreenState({required this.bottomNavIndex});

  final List<Widget> _listWidget = [
    const HomePage(),
    const JadwalScreen(),
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
