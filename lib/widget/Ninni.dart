import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sleepveritabani/models/Song.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';

class Ninni extends StatefulWidget {
  Ninni({super.key});

  @override
  State<Ninni> createState() => _NinniState();
}

class _NinniState extends State<Ninni> {
  final player = AudioPlayer();

  final List<Song> songs = [
    Song(
      name: "atem tutem",
      image: "assets/muzik/atemtutem.jpg",
      url: "assets/muzik/atemtutem.mp3",
    ),
    Song(
      name: "dandini",
      image: "assets/muzik/dandini.jpg",
      url: "assets/muzik/dandini.mp3",
    ),
    Song(
      name: "pedagog ninni",
      image: "assets/muzik/pedagogninni.jpg",
      url: "assets/muzik/pedagogninni.mp3",
    ),
    Song(
      name: "uyu yavrum",
      image: "assets/muzik/uyuyavrum.jpg",
      url: "assets/muzik/uyuyavrum.mp3",
    ),
    Song(
      name: "zeka gelistiren",
      image: "assets/muzik/zekagelistiren.jpg",
      url: "assets/muzik/zekagelistiren.mp3",
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
