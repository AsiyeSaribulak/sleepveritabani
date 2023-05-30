import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepveritabani/enum.dart';
import 'package:sleepveritabani/models/alarm/MenuInfo.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:sleepveritabani/modules/Alarm.dart';
import 'package:sleepveritabani/modules/AlarmAnasayfa.dart';
import 'package:sleepveritabani/utils/PopupMenu.dart';
import 'package:sleepveritabani/widget/Doga.dart';
import 'package:sleepveritabani/widget/TabScroll.dart';
import 'package:sleepveritabani/widget/GunlukKaydet.dart';
import 'package:sleepveritabani/widget/UykuKalite.dart';
import 'package:sleepveritabani/widget/UykuProblemleri.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        title: Text(
          "Anasayfa",
          style: TextStyle(
            color: CustomColors.nightBackground,
          ),
        ),
        backgroundColor: CustomColors.background,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/anasayfa.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GunlukKaydet(),
                  ),
                );
                print("uyku günlüğüne tıklandı");
              },
              child: Container(
                height: 230,
                child: Stack(
                  children: [
                    Positioned(
                      top: 35,
                      left: 20,
                      child: Material(
                        child: Container(
                          height: 180.0,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            color: CustomColors.nightBackground,
                            borderRadius: BorderRadius.circular(0.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(-10.0, 10.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 30,
                      child: Card(
                        elevation: 10.0,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/gunluk.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 200,
                      child: Container(
                        height: 150,
                        width: 160,
                        child: Column(
                          children: [
                            Text("Uyku Günlüğüm",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: CustomColors.purple2Background,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic)),
                            Divider(
                              color: CustomColors.blueBackground,
                            ),
                            Text(
                                "Bir uyku takvimi tutmak, uyku kalitenizi ve sağlığınızı artırmak için yaptığınız değişiklikleri izlemenize ve değerlendirmenize yardımcı olabilir.",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: CustomColors.purpleBackground,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Avenir-Book")),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UykuProblemleri(),
                          ),
                        );
                        print("uyku problemlerine tıklandı");
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 25),
                        height: 200,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/uykuproblemleri.png"),
                              fit: BoxFit.fill,
                            ),
                            color: CustomColors.background,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(80.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(-10.0, 0.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                            left: 32,
                            top: 50.0,
                            bottom: 50,
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Uyku Problemleri",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                              SizedBox(
                                height: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///*************sonradan eklenenler */
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UykuKalite(),
                          ),
                        );
                        print("kaliteli uyku tıklandı");
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        height: 200,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("assets/kalite.png"),
                                fit: BoxFit.fill),
                            color: CustomColors.background,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(80.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(-10.0, 0.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                            left: 32,
                            top: 50.0,
                            bottom: 50,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
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

                        print("uyku problemlerine tıklandı");
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 25),
                        height: 200,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/uykuproblemi.jpg"),
                              fit: BoxFit.fill,
                            ),
                            color: CustomColors.background,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(80.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(-10.0, 0.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                            left: 32,
                            top: 50.0,
                            bottom: 50,
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Uyku Problemleri",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                              SizedBox(
                                height: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TabScroll(),
                          ),
                        );
                        print("müzik ruhun gıdasııdır");
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        height: 200,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("assets/uykumuzik.jpg"),
                                fit: BoxFit.fill),
                            color: CustomColors.background,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(80.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(-10.0, 0.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                            left: 32,
                            top: 50.0,
                            bottom: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
