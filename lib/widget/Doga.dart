import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sleepveritabani/models/Song.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';

class Doga extends StatefulWidget {
  Doga({super.key});

  @override
  State<Doga> createState() => _DogaState();
}

class _DogaState extends State<Doga> {
  final player = AudioPlayer();

  final List<Song> songs = [
    Song(
      name: "Yağmur Sesi",
      image: "assets/muzik/yagmur.jpg",
      url: "assets/muzik/yagmur.mp3",
    ),
    Song(
      name: "Kuş Sesi",
      image: "assets/muzik/kus.jpg",
      url: "assets/muzik/kus.mp3",
    ),
    Song(
      name: "Rüzgar Sesi",
      image: "assets/muzik/ruzgar.jpg",
      url: "assets/muzik/ruzgar.mp3",
    ),
    Song(
      name: "Orman Sesi",
      image: "assets/muzik/orman.jpg",
      url: "assets/muzik/orman.mp3",
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
