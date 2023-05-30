import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sleepveritabani/screen/Anasayfa.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToNextScreen() async {
    // Burada istediğiniz kadar bekleyebilir veya başka işlemler yapabilirsiniz
    await Future.delayed(Duration(seconds: 3));
    // Sonraki ekrana geçiş yapmak için Navigator widgetini kullanıyoruz
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Anasayfa(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Lottie.asset('assets/sleepsplash.json'),
          backgroundColor: const Color.fromARGB(253, 14, 18, 49),
          nextScreen: const Anasayfa(),
          splashIconSize: 250,
          splashTransition: SplashTransition.fadeTransition,
          duration: 3000,
          pageTransitionType: PageTransitionType.topToBottom,
          animationDuration: const Duration(milliseconds: 1500),
        ));
  }
}
