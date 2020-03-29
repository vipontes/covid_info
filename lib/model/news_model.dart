import 'package:covidinfo/model/article_model.dart';

class News {
  String status;
  int totalResults;
  List<Article> articles;

  News({this.status, this.totalResults, this.articles});

  News.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    articles = Article.listFromJson(json['articles']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    data['articles'] = Article.jsonFromList(this.articles);
    return data;
  }
}
