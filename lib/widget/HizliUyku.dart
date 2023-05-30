import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sleepveritabani/models/Song.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';

class HizliUyku extends StatefulWidget {
  HizliUyku({super.key});

  @override
  State<HizliUyku> createState() => _HizliUykuState();
}

class _HizliUykuState extends State<HizliUyku> {
  final player = AudioPlayer();

  final List<Song> songs = [
    Song(
      name: "Şömine",
      image: "assets/muzik/somine.jpg",
      url: "assets/muzik/somine.mp3",
    ),
    Song(
      name: "Uyku Müziği",
      image: "assets/muzik/uykumuzigi.jpg",
      url: "assets/muzik/uykumuzigi.mp3",
    ),
    Song(
      name: "Uyutan Müzik",
      image: "assets/muzik/uyutanmuzik.jpg",
      url: "assets/muzik/uyutanmuzik.mp3",
    ),
    Song(
      name: "Uyku",
      image: "assets/muzik/sleep.jpg",
      url: "assets/muzik/sleep.mp3",
    ),
  ];

  List? music;

  @override
  void initState() {
    // TODO: implement initState
    music = songs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: GridView.count(
        crossAxisCount: 2,
        children: songs.map((song) => buildCard(song)).toList(),
      ),
    );
  }

  Widget buildCard(Song song) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
          onTap: () async {
            player.stop();
            await player.setAsset(song.url);
            player.play();
          },
          child: Image.asset(
            song.image,
            fit: BoxFit.fill,
          )),
    );
  }
}
