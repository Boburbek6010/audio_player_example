class AudiobookModel {
  final String title;
  final String author;
  final String url;

  AudiobookModel({
    required this.title,
    required this.author,
    required this.url,
  });

  factory AudiobookModel.fromJson(Map<String, dynamic> json) {
    return AudiobookModel(
      title: json['title'] as String,
      author: json['author'] as String,
      url: json['url'] as String,
    );
  }
}
