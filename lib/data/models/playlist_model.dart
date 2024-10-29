class PlaylistModel {
  final String name;
  final List<String> audioUrls;

  PlaylistModel({
    required this.name,
    required this.audioUrls,
  });

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      name: json['name'] as String,
      audioUrls: List<String>.from(json['audioUrls'] as List),
    );
  }
}
