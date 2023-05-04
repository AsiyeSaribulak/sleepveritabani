import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static const String DB_NAME = "sleep.db";
  static Future<Database> veritabaniErisim() async {
    String dbYolu = join(await getDatabasesPath(), DB_NAME);
    if (await databaseExists(dbYolu)) {
      print("Veritabanı zaten var koplamaya gerek yok");
      final directory = await getApplicationDocumentsDirectory();
      print(directory.path);
    } else {
      ByteData data = await rootBundle.load("veritabani/$DB_NAME");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbYolu).writeAsBytes(bytes, flush: true);
      print("Veritabanı kopyalandı");
    }
    return openDatabase(dbYolu, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''   CREATE TABLE IF NOT EXISTS "sleep_sleep" (
	"id"	INTEGER NOT NULL,
	"start"	TEXT,
	"sleepQuality"	INTEGER,
	"regularity"	INTEGER,
	"heartRate"	INTEGER,
	"timeInBed"	TEXT,
	"timeAsleep"	TEXT,
	"remSleep"	INTEGER,
	"deepSleep"	INTEGER,
	"lightSleep"	INTEGER,
	"end"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
); 
     ''');
    });
  }
}
