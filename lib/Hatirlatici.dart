/*import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_picker_widget/time_picker_widget.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

class UykuHatirlatici extends StatefulWidget {
  const UykuHatirlatici({Key? key}) : super(key: key);

  @override
  _UykuHatirlaticiState createState() => _UykuHatirlaticiState();
}

class _UykuHatirlaticiState extends State<UykuHatirlatici> {
  bool hatirlaticiAktif = false; // hatırlatıcıyı aktif etmek için bool değişkeni
  String hatirlaticiSaati = "00:00"; // hatırlatıcının saati için String değişkeni
  TimeOfDay secilenSaat = TimeOfDay(hour: 0, minute: 0); // saati seçmek için TimeOfDay değişkeni

  @override
  void initState() {
    super.initState();
    AndroidAlarmManager.initialize(); // alarm manager'ı başlat
    getSavedTime(); // kaydedilmiş saati al
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uyku Hatırlatıcısı"),
        backgroundColor: Colors.black45,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Uyku Hatırlatıcıyı Aktif Et",
                  style: TextStyle(color: Colors.white),
                ),
                Switch(
                  value: hatirlaticiAktif,
                  onChanged: (value) {
                    setState(() {
                      hatirlaticiAktif = value; // switch'in değerini değiştir
                    });
                    if (hatirlaticiAktif) {
                      setAlarm(); // alarmı kur
                    } else {
                      cancelAlarm(); // alarmı iptal et
                    }
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                zamanSec(); // saati ayarlamak için fonksiyon çağır
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bana şu zaman hatırlat",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Text(hatirlaticiSaati), // hatırlatıcının saati
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void zamanSec() async {
    final TimeOfDay? secilenSaat = await showTimePicker(
      context: context, initialTime: secilenSaat,);
    if (secilenSaat != null && secilenSaat != secilenSaat) {
      setState(() {
        secilenSaat = secilenSaat; });}} // seçilen saati al ve güncelle

  void setAlarm() async {
    final DateTime now = DateTime.now();
    final DateTime uykuVakti = DateTime(now.year, now.month, now.day,
        secilenSaat.hour, secilenSaat.minute); // seçilen saate göre tarih oluştur
    await AndroidAlarmManager.oneShotAt(uykuVakti, 0, showNotification,
        exact: true, wakeup: true); // alarmı kur ve bildirim göstermek için fonksiyon çağır
        
  }

  void cancelAlarm() async {
    await AndroidAlarmManager.cancel(0); // alarmı iptal et
  }

  void showNotification() async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id', 'your channel name',
       channelDescription:'your channel description',
      importance: Importance.Max, priority: Priority.High);
  var platformChannelSpecifics = NotificationDetails(
      andro idPlatformChannelSpecifics, null);
  await flutterLocalNotificationsPlugin.show(
      0, 'Uyku vakti geldi!', 'Yatağa gitmenin zamanı.', platformChannelSpecifics,
      payload: 'default');
}

  void saveTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); // shared preferences nesnesi oluştur
    prefs.setInt("hour", secilenSaat.hour); // seçilen saatin saat kısmını depola
    prefs.setInt("minute", secilenSaat.minute); // seçilen saatin dakika kısmını depola
  }

  void getSavedTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); // shared preferences nesnesi oluştur
    int hour = prefs.getInt("hour") ?? 0; // depolanan saat kısmını al veya yoksa sıfır ata
    int minute = prefs.getInt("minute") ?? 0; // depolanan dakika kısmını al veya yoksa sıfır ata
    setState(() {
      secilenSaat = TimeOfDay(hour: hour, minute:
          minute); // depolanan değerlere göre TimeOfDay değişkenini güncelle
      hatirlaticiSaati =
          "${secilenSaat.hour}:${secilenSaat.minute}"; // ekranda gösterilecek String değişkenini güncelle
    });
  }
}*/