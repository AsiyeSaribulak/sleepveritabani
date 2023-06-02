import 'package:flutter/material.dart';
import 'package:sleepveritabani/models/Video.dart';
import 'package:sleepveritabani/models/alarm/tema.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoEkrani extends StatefulWidget {
  final String id;

  VideoEkrani({required this.id});

  @override
  _VideoEkraniState createState() => _VideoEkraniState();
}

class _VideoEkraniState extends State<VideoEkrani> {
  YoutubePlayerController? _controller;
  Video? video;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.background,
      ),
      body: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        onReady: () {
          print('Player is ready.');
        },
      ),
    );
  }
}
