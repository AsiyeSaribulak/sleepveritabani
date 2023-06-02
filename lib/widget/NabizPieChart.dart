import 'package:flutter/material.dart';
import 'package:sleepveritabani/repository/GunlukDao.dart';
import 'package:sleepveritabani/models/GunlukModel.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

class NabizPieChart extends StatefulWidget {
  const NabizPieChart({Key? key}) : super(key: key);

  @override
  State<NabizPieChart> createState() => _NabizPieChartState();
}

class _NabizPieChartState extends State<NabizPieChart> {
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
      height: 220,
      width: MediaQuery.of(context).size.width * 0.6,
      child: SfCartesianChart(
          zoomPanBehavior: ZoomPanBehavior(
              enablePinching: true,
              enableDoubleTapZooming: true,
              enablePanning: true),
          primaryXAxis: DateTimeAxis(
              // Changed to DateTimeAxis
              axisLine: AxisLine(color: Colors.black),
              majorGridLines: MajorGridLines(width: 0, color: Colors.black)),
          primaryYAxis: NumericAxis(
            isVisible: true,
            axisLine: AxisLine(color: Colors.black),
            majorGridLines: MajorGridLines(width: 0, color: Colors.black),
            minorGridLines: MinorGridLines(width: 0, color: Colors.black),
          ),
          // Chart title
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: _tooltipBehavior,
          series: <SplineSeries<NabizData, DateTime>>[
            // Changed to FastLineSeries
            SplineSeries<NabizData, DateTime>(
              dataSource: <NabizData>[
                NabizData(
                    1,
                    63,
                    DateTime.parse(
                        "2023-05-25")), // Changed to DateTime objects
                NabizData(2, 62, DateTime.parse("2023-05-25")),
                NabizData(3, 44, DateTime.parse("2023-05-25")),
                NabizData(4, 54, DateTime.parse("2023-05-25")),
                NabizData(5, 66, DateTime.parse("2023-05-25")),
                NabizData(6, 73, DateTime.parse("2023-05-26")),
                NabizData(7, 55, DateTime.parse("2023-05-26")),
                NabizData(8, 60, DateTime.parse("2023-05-26")),
                NabizData(9, 43, DateTime.parse("2023-05-26")),
                NabizData(10, 56, DateTime.parse("2023-05-26")),
                NabizData(11, 64, DateTime.parse("2023-05-27")),
                NabizData(12, 78, DateTime.parse("2023-05-27")),
                NabizData(13, 65, DateTime.parse("2023-05-27")),
                NabizData(14, 70, DateTime.parse("2023-05-27")),
                NabizData(15, 82, DateTime.parse("2023-06-01")),
                NabizData(16, 60, DateTime.parse("2023-06-01")),
                NabizData(17, 61, DateTime.parse("2023-06-01")),
              ],
              xValueMapper: (NabizData gunluk, _) =>
                  gunluk.date.toLocal(), // Changed to return local date
              yValueMapper: (NabizData gunluk, _) => gunluk.heartRate,
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              name: 'nabız',
              color: Colors.red,
            )
          ]),
    );
  }
}

class NabizData {
  final int id;
  final int heartRate;
  final DateTime date;
  final Color color;

  // Assign random colors to slices
  NabizData(this.id, this.heartRate, this.date)
      : color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0);
}
