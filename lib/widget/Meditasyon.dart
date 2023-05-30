import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sleepveritabani/models/Song.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';

class Meditasyon extends StatefulWidget {
  Meditasyon({super.key});

  @override
  State<Meditasyon> createState() => _MeditasyonState();
}

class _MeditasyonState extends State<Meditasyon> {
  final player = AudioPlayer();

  final List<Song> songs = [
    Song(
      name: "Derin Uyku Meditasyon",
      image: "assets/muzik/derinuykumeditasyon.jpg",
      url: "assets/muzik/derinuykumeditasyon.mp3",
    ),
    Song(
      name: "endeless",
      image: "assets/muzik/endeles.jpg",
      url: "assets/muzik/endeless.mp3",
    ),
    Song(
      name: "Meditasyon",
      image: "assets/muzik/meditasyon.jpg",
      url: "assets/muzik/meditation.mp3",
    ),
    Song(
      name: "relaxing",
      image: "assets/muzik/relaxing.jpg",
      url: "assets/muzik/relaxing.mp3",
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
