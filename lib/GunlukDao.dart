import 'dart:convert';
import 'dart:ui';
import 'dart:developer';
import 'package:sklite/neural_network/neural_network.dart';
import 'package:sleepveritabani/models/GunlukHelper.dart';
import 'package:sleepveritabani/models/GunlukModel.dart';
import 'package:sleepveritabani/utils/io.dart';
import 'package:sleepveritabani/widget/GunlukKaydet.dart';
import 'package:sqflite/sqflite.dart';

class GunlukDao {
  // Future<void> gunlukKayit()
  MLPClassifier? mlp;
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

  Future<void> qualityEkle(String date, String start, String end, double steps,
      int heartRate, String sleepNotes, String sleepQuality) async {
    var dbClient = await GunlukHelper().database;
    var bilgiler = <String, dynamic>{};
    bilgiler['date'] = date;
    bilgiler['start'] = start;
    bilgiler['end'] = end;
    bilgiler['steps'] = steps;
    bilgiler['heartRate'] = heartRate;
    bilgiler['sleepNotes'] = sleepNotes;
    bilgiler['sleepQuality'] = sleepQuality;

    await dbClient.insert("gunluk", bilgiler);
  }

  Future<List<Map<String, dynamic>>> getDateAndSleepQuality() async {
    GunlukHelper gunlukHelper = GunlukHelper();
    Database db = await gunlukHelper.database;
    log('db is $db', name: 'my.app.category');
    List<Map<String, dynamic>> results =
        await db.query("gunluk", columns: ["id","date", "sleepQuality"]);
    log('results are ${jsonEncode(results)}', name: 'my.app.category');

    return results;
  }
  Future<int> delete(int? id) async {
    GunlukHelper gunlukHelper = GunlukHelper();
    Database db = await gunlukHelper.database;
    return await db.delete("gunluk", where: 'id= ?', whereArgs: ["id"]);
  }

  Future<List<Map<String,dynamic>>> getAllData() async {
    final dbClient = await GunlukHelper().database;
    return dbClient.query("gunluk",orderBy: "id");
  }

  Future<int> createData(String date, String start, String end, double steps,
      int heartRate, String sleepNotes, String sleepQuality) async{
    final dbClient = await GunlukHelper().database;
    final data = {
      "date": date,
      "start": start,
      "end": end,
      "steps": steps,
      "heartRate": heartRate,
      "sleepNotes": sleepNotes,
      "sleepQuality": sleepQuality,
    };
    final id = await dbClient.insert("gunluk", data,conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }
  Future<List<Map<String,dynamic>>> getSingleData( int id) async {
    final dbClient = await GunlukHelper().database;
    return dbClient.query("gunluk",where: "id=?",whereArgs: [id],limit: 1);
  }




  Future<String> uykuVerileriniHesapla(String uykuBaslangic, String uykuBitis, String adimSayisi) async {
    List<String> baslangicSplit = uykuBaslangic.split(':');
    int baslangicSaat = int.parse(baslangicSplit[0]);
    int baslangicDakika = int.parse(baslangicSplit[1]);

    List<String> bitisSplit = uykuBitis.split(':');
    int bitisSaat = int.parse(bitisSplit[0]);
    int bitisDakika = int.parse(bitisSplit[1]);
    DateTime now = DateTime.now();
    DateTime baslangic =
    DateTime(now.year, now.month, now.day, baslangicSaat, baslangicDakika);
    DateTime bitis =
    DateTime(now.year, now.month, now.day, bitisSaat, bitisDakika);
    double startTime = baslangic.millisecondsSinceEpoch / 1000;
    double endTime = bitis.millisecondsSinceEpoch / 1000;
    // startTime - endTime işlemiyle sonucTime hesapla
    double sonucTime = startTime - endTime;
    // uykuBaslangic ve uykuBitis değerlerini saniyeye dönüştür
    double uykuBaslangicSaniye = baslangic.hour * 3600 + baslangic.minute * 60;
    double uykuBitisSaniye = bitis.hour * 3600 + bitis.minute * 60;
    double adimsayisi = double.parse(adimSayisi);

    List<double> X = [
      sonucTime,
      uykuBaslangicSaniye,
      uykuBitisSaniye,
      adimsayisi
    ];

    String a = await loadModel("assets/mlsleep.json");
    this.mlp = MLPClassifier.fromMap(json.decode(a));

    String? sleepQuality = mlp!.predict(X).toString();

    return sleepQuality;
  }

  Future<String> getSleepQuality(String uykuBaslangic, String uykuBitis, String adimSayisi) async {
    String sleepQuality =
    await uykuVerileriniHesapla(uykuBaslangic, uykuBitis, adimSayisi);
   // setState(() {
     // sleepQuality = sleepQuality;
    //});
    return sleepQuality;
  }

}
