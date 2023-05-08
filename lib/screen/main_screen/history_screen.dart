import 'package:flutter/material.dart';
import 'package:proto_ikan/widget/history_screen_widget/riwayat_transaksi_widget.dart';
import 'package:proto_ikan/widget/history_screen_widget/transaksi_widget.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _tabViews = [
    const TransaksiWidget(),
    const RiwayatTransaksiWidget(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Lelang'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Transaksi'),
            Tab(text: 'Riwayat Transaksi'),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabViews,
      ),
    );
  }
}
