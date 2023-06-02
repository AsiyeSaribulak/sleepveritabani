import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:sleepveritabani/widget/AdimSayisiChart.dart';
import 'package:sleepveritabani/widget/NabizPieChart.dart';
import 'package:sleepveritabani/widget/QualityChart.dart';

class Grafikler extends StatefulWidget {
  const Grafikler({super.key});

  @override
  State<Grafikler> createState() => _GrafiklerState();
}

class _GrafiklerState extends State<Grafikler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomColors.blueBackground,
      body: Container(
        // color: CustomColors.blueBackground,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              //color: CustomColors.kremBackground,
              child: const QualityChart(),
            ),
            Container(
              // color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              //color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.4,
                    //  color: Colors.red,
                    child: AdimSayisiChart(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Lottie.asset(
                        "assets/heartRate.json",
                        height: 30,
                        width: 30,
                        fit: BoxFit.fill,
                      ),
                      NabizPieChart()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
