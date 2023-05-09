import 'package:sleepveritabani/DBHelper.dart';
import 'package:sleepveritabani/models/SleepData.dart';

class SleepDao {
  Future<List<SleepData>> getSleeps() async {
    var dbClient = await DBHelper.veritabaniErisim();
    List<Map<String, dynamic>> maps = await dbClient.query('sleep_sleep');
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return SleepData(
          id: satir["id"],
          start: satir["start"],
          sleepQuality: satir["sleepQuality"],
          regularity: satir["regularity"],
          heartRate: satir["heartRate"],
          timeInBed: satir["timeInBed"],
          timeAsleep: satir["timeAsleep"],
          remSleep: satir["remSleep"],
          deepSleep: satir["deepSleep"],
          lightSleep: satir["lightSleep"],
          end: satir["end"]);
    });
  }
}
