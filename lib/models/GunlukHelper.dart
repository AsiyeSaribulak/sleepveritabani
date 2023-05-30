import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sleepveritabani/models/GunlukModel.dart';
import 'package:sleepveritabani/models/alarm/AlarmData.dart';
import 'package:sqflite/sqflite.dart';

class GunlukHelper {
  static Database? _database;
  static GunlukHelper? gunlukHelper;

  GunlukHelper._createInstance();
  factory GunlukHelper() {
    if (gunlukHelper == null) {
      gunlukHelper = GunlukHelper._createInstance();
    }
    return gunlukHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory databasesDirectory = await getApplicationDocumentsDirectory();
    print("dblocation:" + databasesDirectory.path);
    var dir = await getDatabasesPath();
    var path = dir + "gunluk.db";
    print(path);


    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''   CREATE TABLE IF NOT EXISTS "gunluk" (
	"id"	INTEGER NOT NULL,
  "date"	TEXT NOT NULL,
	"start"	TEXT NOT NULL,
  "end"	TEXT NOT NULL,
	"sleepQuality"	INTEGER,
	"timeInBed"	TEXT,
	"wakeup"	TEXT,
	"sleepNotes"	TEXT,
  "heartRate"	INTEGER NOT NULL,
	"steps"	INTEGER NOT NULL,
	
	PRIMARY KEY("id" AUTOINCREMENT)
); 
     ''');
        await db.execute(''' " INSERT INTO gunluk (id,date,start,end,sleepQuality,timeInBed, wakeUp,sleepNotes,heartRate,steps) 
        VALUES('2023-05-27 02:14:12.1452','2023-05-27 10:24:12.1452','12',NULL,NULL,'uykumu alamadım','60','1000')"  ''');
        await db.execute(''' " INSERT INTO gunluk (id,date,start,end,sleepQuality,timeInBed, wakeUp,sleepNotes,heartRate,steps) 
        VALUES('2023-05-27 23:23:12.1452','2023-05-27 08:09:12.1452','53',NULL,NULL,'güzel bir uyku','54','2369')"  ''');
      },
    );
    return database;
  }

  void insertGunluk(GunlukModel gunlukmodel) async {
    var db = await this.database;
    var result = await db.insert("gunluk", gunlukmodel.toJson());
    print('result : $result');
  }

  Future<List<GunlukModel>> getAllGunluk() async {
    List<GunlukModel> gunluk = [];

    var db = await this.database;
    var result = await db.query("gunluk");
    result.forEach((element) {
      var gunlukmodel = GunlukModel.fromJson(element);
      gunluk.add(gunlukmodel);
    });

    return gunluk;
  }

  Future<int> delete(int? id) async {
    var db = await this.database;
    return await db.delete("gunluk", where: 'id= ?', whereArgs: [id]);
  }
}
