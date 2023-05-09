import 'package:flutter/material.dart';
import 'package:sleepveritabani/NotificationService.dart';
import 'package:sleepveritabani/SleepDao.dart';
import 'package:sleepveritabani/models/SleepData.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:sleepveritabani/modules/Alarm.dart';
import 'package:sleepveritabani/screen/HomePage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  late SleepData sleepData;
  final PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Future<List<SleepData>> tumSleepData() async {
    var veriListesi = await SleepDao().getSleeps();
    for (var i in veriListesi) {
      print(i.id);
    }
    return veriListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.background,
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              child: Container(
                child: const HomePage(),
              ),
            ),
            SizedBox(
              child: Container(
                child:
                    const Text("Uyku", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              child: Container(
                child:
                    const Text("Kayıt", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              child: Container(
                child:
                    const Text("Analiz", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: CustomColors.nightBackground,
          bottomPadding: 12,
          waterDropColor: CustomColors.background,
          inactiveIconColor: CustomColors.background,
          iconSize: 28,
          onItemSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.jumpToPage(index);
          },
          selectedIndex: selectedIndex,
          barItems: [
            BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
            BarItem(
                filledIcon: Icons.nightlight,
                outlinedIcon: Icons.nightlight_outlined),
            BarItem(filledIcon: Iconsax.graph5, outlinedIcon: Iconsax.graph),
            // BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
            BarItem(
                filledIcon: Icons.monitor_rounded,
                outlinedIcon: Icons.monitor_outlined),
          ],
        ));
  }
}
