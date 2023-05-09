import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UykuHatirlatici extends StatefulWidget {
  const UykuHatirlatici(String? payload, {super.key});

  @override
  State<UykuHatirlatici> createState() => _UykuHatirlaticiState();
}

class _UykuHatirlaticiState extends State<UykuHatirlatici> {
  bool aktifMi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Uyku Hatırlatıcı",
          style: TextStyle(
            color: Color.fromARGB(137, 13, 11, 29),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text(
                "Uyku Hatırlatıcıyı Aktif Et",
                style: TextStyle(color: Colors.white),
              ),
              Switch(
                value: aktifMi,
                onChanged: (value) {
                  setState(() {
                    aktifMi = value;
                  });
                  if (aktifMi) {
                    //bildirim gönder
                  } else {
                    //cancel
                  }
                },
              )
            ],
          ),
          Row(),
        ],
      ),
    );
  }
}
