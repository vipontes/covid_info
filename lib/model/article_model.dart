import 'package:covidinfo/model/source_model.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Article.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source']);
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source.toJson();
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }

  static Map<int, dynamic> jsonFromList(List<Article> articleList) {
    Map<int, dynamic> data = Map<int, dynamic>();

    int i = 0;
    for (final item in articleList) {
      data[i] = item.toJson();
      i++;
    }

    return data;
  }

  static List<Article> listFromJson(List<dynamic> json) {
    List<Article> data = List();

    for (final item in json) {
      Article element = Article(
          source: Source.fromJson(item["source"]),
          author: item["author"],
          title: item["title"],
          description: item["description"],
          url: item["url"],
          urlToImage: item["urlToImage"],
          publishedAt: item["publishedAt"],
          content: item["content"]);

      data.add(element);
    }

    return data;
  }
}
