import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sleepveritabani/enum.dart';
import 'package:sleepveritabani/models/alarm/MenuInfo.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:sleepveritabani/modules/AlarmAnasayfa.dart';
import 'package:sleepveritabani/widget/TabScroll.dart';

class UykuPage extends StatefulWidget {
  const UykuPage({super.key});

  @override
  State<UykuPage> createState() => _UykuPageState();
}

class _UykuPageState extends State<UykuPage> {
  Widget selamlama() {
    var saat = DateTime.now().hour;
    if (saat < 12) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/gunaydin.json',
              height: MediaQuery.of(context).size.height * 0.2),
          Text(
            'Günaydın',
            style: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 20.0,
                    color: CustomColors.mintBackground,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'avenir'),
          ),
        ],
      );
    }
    if (saat < 20) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/baykus.json',
              height: MediaQuery.of(context).size.height * 0.2),
          Text(
            'İyi Akşamlar',
            style: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 20.0,
                    color: CustomColors.mintBackground,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'avenir'),
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/baykus.json',
            height: MediaQuery.of(context).size.height * 0.2),
        Text(
          'İyi Geceler',
          style: TextStyle(
              shadows: [
                Shadow(
                  blurRadius: 20.0,
                  color: CustomColors.mintBackground,
                  offset: Offset(5.0, 5.0),
                ),
              ],
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'avenir'),
        ),
      ],
    );
  }

  _UykuPageState() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/uykubackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.5,
              child: selamlama(),

              // color: Colors.red,
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 8,
                top: 8,
                left: 8,
                bottom: 0.1,
              ),
              height: MediaQuery.of(context).size.height * 0.40,
              // color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabScroll()));
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/uykumuzik.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 120,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("saat e tıklandı");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChangeNotifierProvider<MenuInfo>(
                                create: (context) => MenuInfo(MenuType.clock),
                                child: AlarmAnasayfa(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/saat.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 120,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (() {
                          print("tıklandı nefes");
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/nefesal.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 120,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
