class AudiobookModel {
  final String title;
  final String author;
  final String audioUrl;
  final String description;

  AudiobookModel({
    required this.title,
    required this.author,
    required this.audioUrl,
    required this.description,
  });

  factory AudiobookModel.fromJson(Map<String, dynamic> json) {
    return AudiobookModel(
      title: json['title'] as String,
      author: json['author'] as String,
      audioUrl: json['audio_url'] as String,
      description: json['description'] as String,
    );
  }
}
