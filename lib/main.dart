import 'package:flutter/material.dart';
import 'package:sleepveritabani/NotificationService.dart';
import 'package:sleepveritabani/screen/SplashScreen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initialiseNotification();
  //await Future.delayed(const Duration(seconds: 1));
  //FlutterNativeSplash.remove();
  runApp(const SplashScreen());
}
