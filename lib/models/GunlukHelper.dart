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
