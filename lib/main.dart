import 'package:flutter/material.dart';
import 'package:sleepveritabani/SleepDao.dart';
import 'package:sleepveritabani/SleepData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  late SleepData sleepData;

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
      appBar: AppBar(
        title: const Text("Sleep Data App"),
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder<List<SleepData>>(
              future: tumSleepData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var tumUyku = snapshot.data;
                  return Container(
                    height: 600,
                    width: 600,
                    child: SfCartesianChart(
                      title: ChartTitle(text: 'Sleep Quality Overwiew'),
                      primaryXAxis: NumericAxis(
                        title: AxisTitle(text: 'Sleep id'),
                      ),
                      primaryYAxis: NumericAxis(
                        title: AxisTitle(text: 'Sleep Quality'),
                      ),
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        activationMode: ActivationMode.longPress,
                      ),
                      series: <ChartSeries>[
                        ColumnSeries<SleepData, int>(
                          dataSource: tumUyku!,
                          xValueMapper: (SleepData sleep, _) => sleep.id,
                          yValueMapper: (SleepData sleep, _) =>
                              sleep.sleepQuality,
                          name: "Quality",
                          legendIconType: LegendIconType.diamond,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            labelPosition: ChartDataLabelPosition.inside,
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

dynamic getSleepData() async {
  var sleepData = await SleepDao().getSleeps();
  return sleepData;
}
