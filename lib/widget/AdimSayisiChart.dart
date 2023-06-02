import 'package:flutter/material.dart';
import 'package:sleepveritabani/repository/GunlukDao.dart';
import 'package:sleepveritabani/models/GunlukModel.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdimSayisiChart extends StatefulWidget {
  const AdimSayisiChart({Key? key}) : super(key: key);

  @override
  State<AdimSayisiChart> createState() => _AdimSayisiChartState();
}

class _AdimSayisiChartState extends State<AdimSayisiChart> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  List<GunlukModel> dataList() {
    List<GunlukModel> data = [];
    Future<List<GunlukModel>> gunlukListFuture = GunlukDao().getAllGunluk();

    gunlukListFuture.then((gunlukList) {
      for (GunlukModel gunluk in gunlukList) {
        data.add(gunluk);
      }
    });

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: SfCartesianChart(
                    zoomPanBehavior: ZoomPanBehavior(
                        enablePinching: true,
                        enableDoubleTapZooming: true,
                        enablePanning: true),
                    primaryXAxis: DateTimeAxis(
                        // Changed to DateTimeAxis
                        axisLine: AxisLine(color: Colors.black),
                        majorGridLines:
                            MajorGridLines(width: 0, color: Colors.black)),
                    primaryYAxis: NumericAxis(
                      isVisible: true,
                      axisLine: AxisLine(color: Colors.black),
                      majorGridLines:
                          MajorGridLines(width: 0, color: Colors.black),
                    ),
                    // Chart title
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: _tooltipBehavior,
                    series: <ColumnSeries<StepsData, DateTime>>[
                      // Changed to ColumnSeries
                      ColumnSeries<StepsData, DateTime>(
                        dataSource: <StepsData>[
                          StepsData(
                              1,
                              0,
                              DateTime.parse(
                                  "2023-05-25")), // Changed to DateTime objects
                          StepsData(2, 4780, DateTime.parse("2023-05-25")),
                          StepsData(3, 1478, DateTime.parse("2023-05-25")),
                          StepsData(4, 23694, DateTime.parse("2023-05-25")),
                          StepsData(5, 5342, DateTime.parse("2023-05-25")),
                          StepsData(6, 3500, DateTime.parse("2023-05-26")),
                          StepsData(7, 2563, DateTime.parse("2023-05-26")),
                          StepsData(8, 5632, DateTime.parse("2023-05-26")),
                          StepsData(9, 1000, DateTime.parse("2023-05-26")),
                          StepsData(10, 632, DateTime.parse("2023-05-26")),
                          StepsData(11, 15230, DateTime.parse("2023-05-27")),
                          StepsData(12, 3654, DateTime.parse("2023-05-27")),
                          StepsData(13, 4530, DateTime.parse("2023-05-27")),
                          StepsData(14, 3000, DateTime.parse("2023-05-27")),
                          StepsData(15, 256, DateTime.parse("2023-06-01")),
                          StepsData(16, 2568, DateTime.parse("2023-06-01")),
                          StepsData(17, 10000, DateTime.parse("2023-06-01")),
                        ],
                        xValueMapper: (StepsData gunluk, _) => gunluk.date
                            .toLocal(), // Changed to return local date
                        yValueMapper: (StepsData gunluk, _) => gunluk.steps,
                        // Enable data label
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                        name: 'adım sayısı',
                        color: const Color.fromARGB(255, 67, 214, 72),
                      )
                    ]))));
  }
}

class StepsData {
  final int id;
  final int steps;
  final DateTime date; // Changed to DateTime type
  StepsData(this.id, this.steps, this.date);
}
