class NetworkNews {
  NetworkNews({
    required this.status,
    this.totalResult,
    required this.articles,
  });

  String status;
  double? totalResult;
  List<Article> articles;

  factory NetworkNews.fromJson(Map<String, dynamic> json) {
    return NetworkNews(
      status: json["status"],
      totalResult: json["totalResult"] != null ? (json["totalResult"] as num).toDouble() : null,
      articles: List<Article>.from(
        json["articles"].map((item) => Article.fromJson(item)),
      ),
    );
  }
}

class Article {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  Source? source;
  String? content;

  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.source,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json["author"] as String?,        // use as String? to allow null
      title: json["title"] as String?,
      description: json["description"] as String?,
      url: json["url"] as String?,
      urlToImage: json["urlToImage"] as String?,
      publishedAt: json["publishedAt"] as String?,
      source: json["source"] != null ? Source.fromJson(json["source"]) : null,
      content: json["content"] as String?,
    );
  }

}

class Source {
  Source({this.id, this.name});

  String? id;
  String? name;

  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}
