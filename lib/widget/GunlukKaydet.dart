import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:sklite/neural_network/neural_network.dart';
import 'package:sleepveritabani/GunlukDao.dart';
import 'package:sleepveritabani/models/GunlukModel.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:sleepveritabani/widget/SleepQualityList.dart';
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
  GunlukModel? gunlukModel;
  var now = DateTime.now().toLocal(); //yerel tarih

  String formatDate = DateFormat('dd-MM-yyyy').format(DateTime.now()); //yıl-ay-gün formatı
  final uykuBaslangicController = TextEditingController();
  final uykuBitisController = TextEditingController();
  final adimSayisiController = TextEditingController();
  final kalpAtisHiziController = TextEditingController();
  final uykuNotuController = TextEditingController();



  void saveData(String date, String start, String end, double steps,
      int heartRate, String sleepNotes, String sleepQuality) async{
    await GunlukDao().createData(date, start, end, steps, heartRate, sleepNotes, sleepQuality);
    List<Map<String,dynamic>> sleepdata=await GunlukDao().getDateAndSleepQuality();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SleepQualityList(sleepdata:sleepdata))
    );
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
          DataCell(Text(formatDate,style: style(),)), //gün değeri
          DataCell(Text(uykuBaslangic,style: style())),
          DataCell(Text(uykuBitis,style: style())),
          DataCell(Text(adimSayisi,style: style())),
          DataCell(Text(kalpAtisHizi,style: style())),
          DataCell(Text(uykuNotu,style: style())),
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
            image: AssetImage("assets/diary.PNG"),
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
                margin: EdgeInsets.all(10.0),
                // color: CustomColors.pinkBackground,
                child: Column(
                  children: [
                     Align(
                        alignment: Alignment.topRight, //sol-üst köşeye hizalamak
                        child: Text("Tarih"
                          , //yerel tarihi almak
                          style: TextStyle(fontSize: 18),
                        ),
                      ),

                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight, //sol-üst köşeye hizalamak
                        child: Text(formatDate
                          , //yerel tarihi almak
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextField(
                        cursorColor: CustomColors.addBackground,
                        controller: uykuBaslangicController,
                        decoration: inputDecoration("Uyku Başlangıç","24:00", Icon(Icons.bed)),
                      ),
                    ),

                    //uyku bitiş için bir textfield widget'ı
                    Expanded(
                      child: TextField(
                        controller: uykuBitisController,
                        decoration: inputDecoration("Uyku bitiş", "08:00", Icon(Icons.sunny_snowing))
                      ),
                    ),
                    //adım sayısı için bir textfield widget'ı
                    Expanded(
                      child: TextField(
                        controller: adimSayisiController,
                        decoration: inputDecoration("Adım Sayısı", "10000", Icon(Icons.directions_walk)),
                        keyboardType: TextInputType
                            .number, //sadece sayı girmek için klavye tipi
                      ),
                    ),
                    //kalp atış hızı için bir textfield widget'ı
                    Expanded(
                      child: TextField(
                        controller: kalpAtisHiziController,
                        decoration: inputDecoration("Kalp Atış Hızı", "80", Icon(Icons.monitor_heart)),
                        keyboardType: TextInputType
                            .number, //sadece sayı girmek için klavye tipi
                      ),
                    ),
                    //uyku notu için bir textfield widget'ı
                    Expanded(
                      child: TextField(
                        controller: uykuNotuController,
                        decoration: inputDecoration("Uyku Notu", "Notunuzu giriniz", Icon(Icons.edit_note)),
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
                        //    showBottomSheet(gunlukModel?.id);
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

                            //  await GunlukDao().gunlukEkle(date, start, end,
                              //    steps, heartRate, sleepNotes);

                              List<DataRow> tableRows = tabloyaEkle();
                              String adimSayisi = steps.toString();
                              Future<String> sleepQuality =GunlukDao().
                                  uykuVerileriniHesapla(start, end, adimSayisi);
                              String quality= await sleepQuality;
                            //  await GunlukDao().qualityEkle(date, start, end, steps, heartRate, sleepNotes, quality);
                            //  saveData(date, start, end, steps, heartRate, sleepNotes, quality);
                              GunlukDao().createData(date, start, end, steps, heartRate, sleepNotes, quality);
                              List<Map<String,dynamic>> sleepdata=await GunlukDao().getDateAndSleepQuality();


                              // Future<List<DataRow>> listTable= tabloyaListeEkle();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TableWidget(
                                    tableRows: tableRows,
                                    sleepQuality: sleepQuality,
                                    sleepdata: sleepdata,

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

  InputDecoration inputDecoration(String text,String format,Icon icon){
    return InputDecoration(
      fillColor: CustomColors.addBackground,
      focusColor: CustomColors.addBackground,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: CustomColors.addBackground,
        ),
      ),
      labelText: text,
      labelStyle: TextStyle(
        color:CustomColors.purple2Background,
      ),
      floatingLabelStyle: TextStyle(
        color: CustomColors.purple2Background,
      ),
      helperText: "lütfen şu formatta giriniz: $format",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: CustomColors.nightBackground,
          style: BorderStyle.solid,
        ),
      ),
      prefixIcon: icon,
      prefixIconColor: CustomColors.purple2Background,
    );
  }

  TextStyle style() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.purple,
    );
  }
}
