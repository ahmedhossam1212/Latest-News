class NewsModel {
  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  late final String status;
  late final int totalResults;
  late final List<Articles> articles;

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    articles =
        List.from(json['articles']).map((e) => Articles.fromJson(e)).toList();
  }
}

class Articles {
  Articles({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });
  late final Source source;
  late final String? author;
  late final String title;
  late final String? description;
  late final String url;
  late final String? urlToImage;
  late final String publishedAt;
  late final String? content;

  Articles.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source']);
    author = json['author'] ?? "McPhilips";
    title = json['title'];
    description = json['description'] ?? "";
    url = json['url'];
    urlToImage = json['urlToImage'] ??
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsXmNFNSqE45G3Gv3gToJ_gEHME5TcR0yytg&usqp=CAU";
    publishedAt = json['publishedAt'] ?? "";
    content = json['content'] ?? "";
  }
}

class Source {
  Source({
    this.id,
    required this.name,
  });
  late final String? id;
  late final String name;

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
  }
}
