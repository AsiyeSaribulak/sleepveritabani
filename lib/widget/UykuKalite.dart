import 'package:flutter/material.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';

class UykuKalite extends StatelessWidget {
  const UykuKalite({super.key});
  TextStyle titleStyle() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: CustomColors.nightBackground,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.tahtaBackground,
      appBar: AppBar(
        backgroundColor: CustomColors.tahtaBackground,
        title: const Text('İyi Bir Uyku İçin Neler Yapmalısın?'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/kalite2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '1. Uykulu hissedinceye kadar yatağa gitmeyin. Uykunuz gelinceye kadar aklınızdan uyku ile ilgili endişelerinizi atmanızı sağlayacak rahatlatıcı şeyler yapın. Kitap okuyabilir ya da hafif müzikler dinleyebilirsiniz.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '2. İlk 20 dakika uyuyamazsanız yataktan ve yatak odanızdan çıkın. Yatak odanız yalnızca uyumak için gideceğiniz yer olmalı. Başka bir odada uykunuz gelinceye kadar uyarıcı olmayacak işlerle uğraşıp uykunuz geldiğinde yatağınıza dönebilirsiniz.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '3. Her gece yatmadan önce ılık banyo, yoga, meditasyon gibi rahatlatıcı şeyler yapın.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '4. Her gün aynı saatte kalkın. Düzenli bir uyku programına uymaya çalışın. Hafta sonları ve tatillerde de bu programa uyun.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '5. Mümkünse gündüz uykularından kaçının.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '6. Beslenme konusunda da düzenli bir program takip edin. Yeme, içme, hareket konusunda vücut saatinizin düzgün çalışması için uğraşın.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '7. Yatak odanızın sessiz, serin ve karanlık olduğundan emin olun.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '8. Yatağa gitmeden hemen önce yemek yemeyin, nikotin almayın.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '9. Öğleden sonra kafein tüketmeyin.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '10. Uyku saatinizden önceki 6 saat boyunca alkollü içecek tüketmeyin.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '11. Uyku saatinizden önceki 4-5 saat boyunca ağır egzersiz ve idmanlardan, stresli aktivitelerden kaçının. Spor ve egzersizler için sabah saatlerini tercih edin.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '12. Uyku hapları ve yatıştırıcı ilaçlardan kaçının.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '13. Horlamanız hafifse yana dönerek yatın.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
              Text(
                '14. Hamile olduğu için uykusuzluk çeken kadınlar ılık süt içerek, akşamları sıcak banyo ve düzenli egzersizlerle uykuya dalmayı kolaylaştırabilir. Baş, karın ve diz bölümlerini yastıkla destekleyebilir.',
                style: titleStyle(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
