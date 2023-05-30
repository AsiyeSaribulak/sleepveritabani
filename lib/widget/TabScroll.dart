import 'package:flutter/material.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:sleepveritabani/widget/Doga.dart';
import 'package:sleepveritabani/widget/HizliUyku.dart';
import 'package:sleepveritabani/widget/Meditasyon.dart';
import 'package:sleepveritabani/widget/Ninni.dart';

class TabScroll extends StatefulWidget {
  TabScroll({Key? key}) : super(key: key);

  @override
  _TabScrollState createState() => _TabScrollState();
}

class _TabScrollState extends State<TabScroll>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        backgroundColor: CustomColors.background,
        title: const Text("Müzikler"),
        bottom: TabBar(
          indicatorColor: CustomColors.greenColor,
          dividerColor: CustomColors.greenColor,
          controller: _tabController,
          tabs: const [
            Tab(text: "Meditasyon"),
            Tab(text: "Hızlı Uyku"),
            Tab(text: "Doğa"),
            Tab(text: "Ninni"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Meditasyon
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Meditasyon(),
          ),

          // Hızlı Uyku
          Container(
            padding: const EdgeInsets.all(8.0),
            child: HizliUyku(),
          ),

          // Doğa
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Doga(),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Ninni(),
          ),
        ],
      ),
    );
  }
}
