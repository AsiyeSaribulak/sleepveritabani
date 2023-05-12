import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sleepveritabani/screen/Anasayfa.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Lottie.asset('assets/sleep.json'),
          backgroundColor: Color.fromARGB(253, 14, 18, 49),
          nextScreen: const Anasayfa(),
          splashIconSize: 250,
          splashTransition: SplashTransition.fadeTransition,
          duration: 3000,
          pageTransitionType: PageTransitionType.topToBottom,
          animationDuration: const Duration(milliseconds: 1500),
        ));
  }
}
