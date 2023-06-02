import 'package:sleepveritabani/models/Video.dart';

class Kanal {
  late final String id;
  late final String title;
  late final String profilePictureUrl;
  late final String subscriberCount;
  late final String videoCount;
  late final String uploadPlaylistId;
  late List<Video> videos;

  Kanal({
    required this.id,
    required this.title,
    required this.profilePictureUrl,
    required this.subscriberCount,
    required this.videoCount,
    required this.uploadPlaylistId,
    required this.videos,
  });

  factory Kanal.fromMap(Map<String, dynamic> map) {
    return Kanal(
      id: map['id'],
      title: map['snippet']['title'],
      profilePictureUrl: map['snippet']['thumbnails']['default']['url'],
      subscriberCount: map['statistics']['subscriberCount'],
      videoCount: map['statistics']['videoCount'],
      uploadPlaylistId: map['contentDetails']['relatedPlaylists']['uploads'],
      videos: [],
    );
  }
}
