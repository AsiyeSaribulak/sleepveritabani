import 'package:flutter/material.dart';
import 'package:sleepveritabani/GunlukDao.dart';
import 'package:sleepveritabani/widget/GunlukKaydet.dart';
import 'package:sleepveritabani/widget/SleepQualityList.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:lottie/lottie.dart';

class TableWidget extends StatefulWidget {
  final List<DataRow>? tableRows;
  final Future<List<DataRow>>? listTable;
  final Future<String>? sleepQuality;
  final List<Map<String, dynamic>>? sleepdata;
  final GunlukDao? gunlukDao;

  //final List<DataRow> data; // Tablo verilerini tutan parametre
  const TableWidget(
      {super.key,
      this.tableRows,
      this.listTable,
      this.sleepQuality, this.gunlukDao,this.sleepdata}); // Constructor

  @override
  _TableWidgetState createState() =>
      _TableWidgetState(); // Parametre yollamıyoruz
}

class _TableWidgetState extends State<TableWidget> {
  GunlukKaydet? gunlukKaydet;

  // Data parametresini tanımlamıyoruz

  final uykuBaslangicController = TextEditingController();
  final uykuBitisController = TextEditingController();
  final adimSayisiController = TextEditingController();
  final kalpAtisHiziController = TextEditingController();
  final uykuNotuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: EdgeInsets.only(top:50),
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/diary2.PNG"),
              fit: BoxFit.fill,
            )),
        child: Column(
          children: [
            Container(
            margin: EdgeInsets.all(8),
             // color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    DataTable(
                      columnSpacing: 10.0,
                      horizontalMargin: 20.0,
                      showBottomBorder: true,
                      // dividerThickness: 2.0,
                      border: TableBorder.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                      // headingRowHeight: 30.0,
                      columns:  <DataColumn>[
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Gün',
                          textAlign: TextAlign.center,
                          style: style(),
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Uyku Başlangıç',
                                    textAlign: TextAlign.center,
                                    style: style()))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Uyku Bitiş',
                                    textAlign: TextAlign.center,
                                    style: style()))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Adım Sayısı',
                                    textAlign: TextAlign.center,
                                    style: style()))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Kalp Atış Hızı',
                                    textAlign: TextAlign.center,
                                    style: style()))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Uyku Notu',
                                    textAlign: TextAlign.center,
                                    style: style(),))),
                      ],
                      rows: widget.tableRows ??
                          [], // Burada tanımladığımız listeyi kullanıyoruz
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Expanded(
                child: Container(
                 // color: Colors.blue,

                  height: MediaQuery.of(context).size.height * 0.80,
                  width: MediaQuery.of(context).size.width ,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 35,
                          width: 100,
                          child: FutureBuilder<String>(
                              future: widget.sleepQuality,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                } else {
                                  final sleepQuality = snapshot.data ?? '';
                                  return Column(
                                    children: [
                                      Text("Uyku Kalitesi: ",overflow: TextOverflow.ellipsis,textAlign: TextAlign.center, ),
                                      Text(sleepQuality,textAlign: TextAlign.center, style: style(),),
                                    ],
                                  );
                                }
                              }),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          iconSize: 30,
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SleepQualityList(sleepdata: widget.sleepdata,)));
                            },
                            icon: Icon(Icons.arrow_circle_right_outlined)
                        ),
                      ),

                    ],
                  ),

                )
            ),
            Align(
              alignment: Alignment.center,
               child: Container(

                  child: Lottie.asset("assets/plan.json",height: 450,width: 500,fit: BoxFit.fill,),
                ),
            ),
          ],
        ),
      ),

    );
  }

  TextStyle style() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
     // color: Colors.black,
    );
  }
}
