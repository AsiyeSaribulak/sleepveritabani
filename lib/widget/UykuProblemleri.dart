import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';

class UykuProblemleri extends StatefulWidget {
  const UykuProblemleri({super.key});

  @override
  State<UykuProblemleri> createState() => _UykuProblemleriState();
}

class _UykuProblemleriState extends State<UykuProblemleri> {
  var url = Uri.parse(
      "https://www.okanhastanesi.com.tr/uyku-bozukluklarinin-sebepleri-nelerdir");
  //var data;

  //baslik=.getElementsByClassName("sub-content-container col-md-9 col-lg-9")[0].getElementsByTagName("h1")

  // Future getData() async {
  //   var res = await http.get(url);
  //   final body = res.body;
  //   final document = HtmlParser(body).parse();
  //   var response = document
  //       .getElementsByClassName("sub-content-container col-md-9 col-lg-9")[0]
  //       .getElementsByTagName("p")
  //       //print(response.toString());
  //       .forEach((element) {
  //     print(element.text.toString());
  //   });
  //   var title = document.querySelectorAll("p").toList();
  //   for (var p in title) {
  //     // print(p.text.toString());
  //   }
  // }

  ///yararlanılan kaynak https://www.erdempsikiyatri.com/uyku-ve-uyku-bozukluklari
  Future getData() async {
    var json = await rootBundle
        .loadString("assets/problem.json"); // JSON dosyasını oku
    var obj = jsonDecode(json); // JavaScript nesnesine dönüştür
    return obj; // nesneyi döndür
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        backgroundColor: CustomColors.background,
        title: Text(
          "Uyku Problemleri",
          style: TextStyle(
            color: CustomColors.nightBackground,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/sleepProblem.png",
                height: MediaQuery.of(context).size.height * 0.20,
                width: 400,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: FutureBuilder(
                  future: getData(), // async fonksiyonu çağır
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      // snapshot veri içeriyorsa
                      var data = snapshot.data; // veriyi al
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap:
                              true, // liste elemanlarının toplam yüksekliğine göre küçült
                          //  physics: const NeverScrollableScrollPhysics(), // liste içinde kaydırma yapma
                          // liste oluştur
                          itemCount: data.length, // liste eleman sayısı
                          itemBuilder: (context, index) {
                            // her eleman için
                            return Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // sütun oluştur
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment
                                    .stretch, // elemanlar arasında eşit boşluk bırak
                                children: [
                                  // sütun içindeki elemanlar
                                  // yerel fotoğraf ekle
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Text(data[index]["title"],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.nightBackground,
                                      ),
                                      textAlign:
                                          TextAlign.center), // başlığı ekle
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01), // 3 cm boşluk bırak
                                  Text(
                                    data[index]["content"],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: CustomColors.nightBackground),
                                  ), // içeriği ekle
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      // snapshot veri içermiyorsa
                      return const CircularProgressIndicator(); // yükleniyor işareti göster
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
