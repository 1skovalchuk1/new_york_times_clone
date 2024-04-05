import 'package:new_york_times_clone/entities/article.dart';

class News {
  final List<Article> news;

  const News({required this.news});

  News.empty()
  : news = [];

  News updateNewsImgPath(String path) {
    for (var i in news) {
      i.updateArticleImgPath(path);
    }
    return this;
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'news': List<dynamic> news} => 
        News(news: news.map((dynamic i) => Article.fromJson(i as Map<String, dynamic>)).toList()),
      _ => throw const FormatException('Failed to load news.'),
    };
  }
}
