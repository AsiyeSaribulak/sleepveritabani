import 'dart:ui';

import 'package:sleepveritabani/models/GunlukHelper.dart';
import 'package:sleepveritabani/models/GunlukModel.dart';
import 'package:sleepveritabani/widget/GunlukKaydet.dart';

class GunlukDao {
  // Future<void> gunlukKayit()

  Future<List<GunlukModel>> getAllGunluk() async {
    var dbClient = await GunlukHelper().database;
    List<Map<String, dynamic>> maps = await dbClient.query('gunluk');
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return GunlukModel(
        id: satir["id"],
        date: satir["date"],
        start: satir["start"],
        end: satir["end"],
        sleepQuality: satir["sleepQuality"],
        timeInBed: satir["timeInBed"],
        wakeup: satir["wakeup"],
        sleepNotes: satir["sleepNotes"],
        heartRate: satir["heartRate"],
        steps: satir["steps"],
      );
    });
  }

  Future<void> gunlukEkle(String date, String start, String end, double steps,
      int heartRate, String sleepNotes) async {
    var dbClient = await GunlukHelper().database;
    var bilgiler = <String, dynamic>{};
    bilgiler['date'] = date;
    bilgiler['start'] = start;
    bilgiler['end'] = end;
    bilgiler['steps'] = steps;
    bilgiler['heartRate'] = heartRate;
    bilgiler['sleepNotes'] = sleepNotes;

    await dbClient.insert("gunluk", bilgiler);
  }
}
