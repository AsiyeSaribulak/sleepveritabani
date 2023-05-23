import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:sklite/neural_network/neural_network.dart';
import 'package:sleepveritabani/GunlukDao.dart';
import 'package:sleepveritabani/models/GunlukModel.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:sleepveritabani/widget/TableWidget.dart';
import 'package:sleepveritabani/GunlukDao.dart';

import '../utils/io.dart';

class GunlukKaydet extends StatefulWidget {
  const GunlukKaydet({Key? key}) : super(key: key);

  @override
  State<GunlukKaydet> createState() => _GunlukKaydetState();
}

class _GunlukKaydetState extends State<GunlukKaydet> {
  MLPClassifier? mlp;
  var now = DateTime.now().toLocal(); //yerel tarih
  String formatDate =
      DateFormat('dd-MM-yyyy').format(DateTime.now()); //yıl-ay-gün formatı

  final uykuBaslangicController = TextEditingController();
  final uykuBitisController = TextEditingController();
  final adimSayisiController = TextEditingController();
  final kalpAtisHiziController = TextEditingController();
  final uykuNotuController = TextEditingController();

  Future<String> uykuVerileriniHesapla(
      String uykuBaslangic, String uykuBitis, String adimSayisi) async {
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

  Future<String> getSleepQuality(
      String uykuBaslangic, String uykuBitis, String adimSayisi) async {
    String sleepQuality =
        await uykuVerileriniHesapla(uykuBaslangic, uykuBitis, adimSayisi);
    setState(() {
      sleepQuality = sleepQuality;
    });
    return sleepQuality;
  }

  List<DataRow> tabloyaEkle() {
    List<DataRow> tableRows = [];
    String uykuBaslangic = uykuBaslangicController.text;
    String uykuBitis = uykuBitisController.text;
    String adimSayisi = adimSayisiController.text;
    String kalpAtisHizi = kalpAtisHiziController.text;
    String uykuNotu = uykuNotuController.text;

    tableRows.add(
      DataRow(
        cells: <DataCell>[
          DataCell(Text(formatDate)), //gün değeri
          DataCell(Text(uykuBaslangic)),
          DataCell(Text(uykuBitis)),
          DataCell(Text(adimSayisi)),
          DataCell(Text(kalpAtisHizi)),
          DataCell(Text(uykuNotu)),
        ],
      ),
    );
    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/gunlukbackground.PNG"),
            fit: BoxFit.fill,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: height * 0.35,
                width: width,
                // color: CustomColors.greenBackground,
              ),
              Container(
                height: height * 0.65,
                width: width,
                // color: CustomColors.pinkBackground,
                child: Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft, //sol-üst köşeye hizalamak
                        child: Text(
                          formatDate, //yerel tarihi almak
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: uykuBaslangicController,
                        decoration: InputDecoration(
                          labelText: "Uyku Başlangıç",
                        ),
                      ),
                    ),
                    //uyku bitiş için bir textfield widget'ı
                    Expanded(
                      child: TextField(
                        controller: uykuBitisController,
                        decoration: InputDecoration(
                          labelText: "Uyku Bitiş",
                        ),
                      ),
                    ),
                    //adım sayısı için bir textfield widget'ı
                    Expanded(
                      child: TextField(
                        controller: adimSayisiController,
                        decoration: InputDecoration(
                          labelText: "Adım Sayısı",
                        ),
                        keyboardType: TextInputType
                            .number, //sadece sayı girmek için klavye tipi
                      ),
                    ),
                    //kalp atış hızı için bir textfield widget'ı
                    Expanded(
                      child: TextField(
                        controller: kalpAtisHiziController,
                        decoration: InputDecoration(
                          labelText: "Kalp Atış Hızı",
                        ),
                        keyboardType: TextInputType
                            .number, //sadece sayı girmek için klavye tipi
                      ),
                    ),
                    //uyku notu için bir textfield widget'ı
                    Expanded(
                      child: TextField(
                        controller: uykuNotuController,
                        decoration: InputDecoration(
                          labelText: "Uyku Notu",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: CustomColors.nightBackground,
                            semanticLabel: "ekle",
                          ),
                          onPressed: () async {
                            if (uykuBaslangicController.text != null &&
                                uykuBitisController.text != null &&
                                adimSayisiController.text != null &&
                                kalpAtisHiziController.text != null &&
                                uykuNotuController.text != null) {
                              String? date = DateTime.now().toString();
                              String? start = uykuBaslangicController.text;
                              String? end = uykuBitisController.text;
                              double? steps =
                                  double.parse(adimSayisiController.text);
                              int? heartRate =
                                  int.parse(kalpAtisHiziController.text);
                              String? sleepNotes = uykuNotuController.text;

                              print(date);
                              print(start);
                              print(end);
                              print(steps);
                              print(heartRate);
                              print(sleepNotes);

                              await GunlukDao().gunlukEkle(date, start, end,
                                  steps, heartRate, sleepNotes);
                              List<DataRow> tableRows = tabloyaEkle();
                              String adimSayisi = steps.toString();
                              Future<String> sleepQuality =
                                  uykuVerileriniHesapla(start, end, adimSayisi);
                              // Future<List<DataRow>> listTable= tabloyaListeEkle();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TableWidget(
                                    tableRows: tableRows,
                                    sleepQuality: sleepQuality,
                                  ),
                                ),
                              );
                            } else {
                              // Gerekli alanların boş olduğunu veya null değer içerdiğini belirten bir hata mesajı gösterilebilir.
                              print("Lütfen tüm alanları doldurun.");
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
