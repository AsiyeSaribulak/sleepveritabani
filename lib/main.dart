import 'package:flutter/material.dart';
import 'package:sleepveritabani/NotificationService.dart';
import 'package:sleepveritabani/screen/SplashScreen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initialiseNotification();
  runApp(const SplashScreen());
}
