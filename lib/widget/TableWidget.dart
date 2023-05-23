import 'package:flutter/material.dart';
import 'package:sleepveritabani/widget/GunlukKaydet.dart';

class TableWidget extends StatefulWidget {
  final List<DataRow>? tableRows;
  final Future<List<DataRow>>? listTable;
  final Future<String>? sleepQuality;

  //final List<DataRow> data; // Tablo verilerini tutan parametre
  const TableWidget(
      {super.key,
      this.tableRows,
      this.listTable,
      this.sleepQuality}); // Constructor

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
      appBar: AppBar(
        title: Text('Tablo Widget'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    DataTable(
                      // dataRowMaxHeight: 10.0,
                      columnSpacing: 10.0,
                      horizontalMargin: 20.0,
                      showBottomBorder: true,
                      // dividerThickness: 2.0,
                      border: TableBorder.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                      // headingRowHeight: 30.0,
                      columns: const <DataColumn>[
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Gün',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Uyku Başlangıç',
                                    textAlign: TextAlign.center,
                                    style: TextStyle()))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Uyku Bitiş',
                                    textAlign: TextAlign.center,
                                    style: TextStyle()))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Adım Sayısı',
                                    textAlign: TextAlign.center,
                                    style: TextStyle()))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Kalp Atış Hızı',
                                    textAlign: TextAlign.center,
                                    style: TextStyle()))),
                        DataColumn(
                            label: Expanded(
                                child: Text('Uyku Notu',
                                    textAlign: TextAlign.center,
                                    style: TextStyle()))),
                      ],
                      rows: widget.tableRows ??
                          [], // Burada tanımladığımız listeyi kullanıyoruz
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      color: Colors.white,
                      alignment: Alignment.bottomRight,
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
                              return Text("Uyku Kalitesi: $sleepQuality");
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle style() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }
}
