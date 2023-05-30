class Song {
  final String name;
  final String image;
  final String url;

  Song({required this.name, required this.image, required this.url});

  // Json'dan sınıf nesnesine dönüştürmek için
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      name: json['name'],
      image: json['image'],
      url: json['url'],
    );
  }

  // Sınıf nesnesinden Json'a dönüştürmek için
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'url': url,
    };
  }
}
