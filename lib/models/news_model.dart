class NewsModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  // final String publishedAt;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    // required this.publishedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      // 'publishedAt': publishedAt,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      author: map['author'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String,
      // publishedAt: map['publishedAt'] as String,
    );
  }
}
