import 'package:sleepveritabani/DBHelper.dart';
import 'package:sleepveritabani/models/alarm/AlarmData.dart';

class AlarmDao {
  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await DBHelper.veritabaniErisim();
    var result = await db.insert('alarm', alarmInfo.toMap());
    print('result : $result');
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = [];
    var db = await DBHelper.veritabaniErisim();

    var result = await db.query('alarm');
    result.forEach((element) {
      var alarmInfo = AlarmInfo.fromMap(element);
      _alarms.add(alarmInfo);
    });

    return _alarms;
  }

  Future<int> delete(int? id) async {
    var db = await DBHelper.veritabaniErisim();
    return await db.delete('alarm', where: 'id = ?', whereArgs: [id]);
  }
}
