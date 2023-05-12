import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:sleepveritabani/models/alarm/MenuInfo.dart';
import 'package:sleepveritabani/modules/AlarmAnasayfa.dart';

import '../enum.dart';

/**BU SAYFAYI KULLANMA DAHA SADECE ÖNCEDEN NE YAPTIĞIN BİL DİYE KALSIN BU */

class Alarm {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Alarm() {
    WidgetsFlutterBinding.ensureInitialized();

    var initializationSettingsAndroid = AndroidInitializationSettings('resim');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      final String? payload = notificationResponse.payload;
      if (notificationResponse.payload != null) {
        debugPrint('notification payload: $payload');
      }
    });
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(MenuType.clock),
          child: AlarmAnasayfa(),
        ),
      ),
    );
  }
}
