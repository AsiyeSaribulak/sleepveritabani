import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:postgres/postgres_v3_experimental.dart';
import 'package:sleepveritabani/GunlukDao.dart';
import 'package:sleepveritabani/models/GunlukModel.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';


class SleepQualityList extends StatefulWidget {
  // GunlukDao? gunlukDao;
  List<Map<String, dynamic>>? sleepdata;
  SleepQualityList({super.key, this.sleepdata});

  @override
  State<SleepQualityList> createState() => _SleepQualityListState();
}

class _SleepQualityListState extends State<SleepQualityList> {
  GunlukModel? gunlukModel;
  bool isloading=true;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshData();
  }

  Future<List<Map<String, dynamic>>> getSleepQuality() async {
    List<Map<String, dynamic>> maps =
        await GunlukDao().getDateAndSleepQuality();
    return maps;
  }
  void refreshData() async{
    final data= await GunlukDao().getDateAndSleepQuality();
    setState(() {
      widget.sleepdata=data;
      isloading=false;
    });
  }

  void deleteData(int id) async{
    await GunlukDao().delete(id);
    ScaffoldMessenger.of(context).
    showSnackBar( SnackBar(content: Text("Kayıt Silindi: $id"),
      backgroundColor: CustomColors.tahtaBackground,)
    );
    refreshData();
  }

  final uykuBaslangicController = TextEditingController();
  final uykuBitisController = TextEditingController();
  final adimSayisiController = TextEditingController();
  final kalpAtisHiziController = TextEditingController();
  final uykuNotuController = TextEditingController();


  /*void showBottomSheet(int? id) async{
    List<Map<String, dynamic>>? sleepdata = await GunlukDao().getDateAndSleepQuality();
    if(id!=null){
      final existingData= sleepdata.firstWhere((element) => element['id']==id);

      if(existingData != null){
        uykuBaslangicController.text=existingData['start'] ?? ""; // Use ?? operator to assign a default value if null
        uykuBitisController.text=existingData['end'] ?? "";
        adimSayisiController.text=existingData['steps'] ?? "";
        kalpAtisHiziController.text=existingData['heartRate'] ?? "";
        uykuNotuController.text=existingData['sleepNotes'] ?? "";
        //String sleepQuality=existingData['sleepQuality'];
      }
      //String sleepQuality=existingData['sleepQuality'];
    }
  }*/

  Widget build(BuildContext context) {
    DateTime date=DateTime.parse(widget.sleepdata?[0]['date']);
    String formatDate = DateFormat('dd-MM-yyyy').format(date);
    print(formatDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.tahtaBackground,
        title: Text("Günlük Verileri"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/diary2.PNG"),
              fit: BoxFit.fill,
            )),
        child: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scrollbar(
              child: ListView.builder(
                 itemCount: widget.sleepdata?.length ?? 0,
                 itemBuilder: (context, index) => Card(
                   color: Colors.white.withOpacity(0.3),
                   margin: EdgeInsets.all(8),
                   child: ListTile(
                     title: Padding(
                       padding: const EdgeInsets.symmetric(vertical: 8.0),
                       child: Text("Tarih:"+ formatDate ?? "Unknown"),
                     ),
                     subtitle:
                     Text("Uyku Kalitesi:"+ widget.sleepdata![index]['sleepQuality'].toString() ?? "Unknown"),
                     //Text("id:"+ widget.sleepdata![index]['id'].toString() ?? "Unknown"),
                     trailing: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         IconButton(
                           icon: Icon(Icons.delete,color: CustomColors.tahtaBackground,),
                           onPressed: () {
                             int id=widget.sleepdata![index]['id'] as int;
                             print("id: ${id}");
                           //  showBottomSheet(null);
                             deleteData(id);

                           },
                         ),
                       ],
                     ),
                   ),
                 ),
                // Map<String, dynamic> sleepRecord =
                 // widget.sleepdata![index]; // Her bir kaydı alın
                 // String date = sleepRecord['date'];
                 // int? sleepQuality = sleepRecord['sleepQuality'];


        ),
            ),
      ),
    );
  }
}
