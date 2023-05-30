import 'package:flutter/material.dart';
import 'package:sleepveritabani/GunlukDao.dart';
import 'package:sleepveritabani/models/GunlukModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class QualityChart extends StatefulWidget {
  const QualityChart({Key? key}) : super(key: key);

  @override
  State<QualityChart> createState() => _QualityChartState();
}

class _QualityChartState extends State<QualityChart> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState(){
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
    return  Scaffold(
      appBar: AppBar(
        title: Text("Uyku Kalitesi"),
      ), body: Center(
    child: Container(

    child: SfCartesianChart(

        primaryXAxis: CategoryAxis(),
    // Chart title
    title: ChartTitle(text: 'Günlük Uyku Kalitesi Analizi'),
    // Enable legend
    legend: Legend(isVisible: true),
    // Enable tooltip
    tooltipBehavior: _tooltipBehavior,

    series: <LineSeries<GunlukData, String>>[
    LineSeries<GunlukData, String>(
    dataSource:  <GunlukData>[
      GunlukData(1, 87, "2023-05-25"),
      GunlukData(2, 69, "2023-05-25"),
      GunlukData(3, 53, "2023-05-25"),
      GunlukData(4, 67, "2023-05-25"),
      GunlukData(5, 53, "2023-05-25"),
      GunlukData(6,87, "2023-05-26"),
      GunlukData(7,87, "2023-05-26"),
      GunlukData(8,53, "2023-05-26"),
      GunlukData(9,70, "2023-05-26"),
      GunlukData(10, 90, "2023-05-26"),
      GunlukData(11, 12, "2023-05-27"),
      GunlukData(12, 63, "2023-05-27"),
      GunlukData(13, 53, "2023-05-27"),
      GunlukData(14, 55, "2023-05-27"),
    ],
    xValueMapper: (GunlukData gunluk, _) => gunluk.date,
    yValueMapper: (GunlukData gunluk, _) => gunluk.sleepQuality,
    // Enable data label
    dataLabelSettings: DataLabelSettings(isVisible: true)
    )
    ]
    )
    )
    )
    );
  }

}
class GunlukData{
  final int id;
  final int sleepQuality;
  final String date;
  GunlukData(this.id,this.sleepQuality,this.date);
}

