import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:new_york_times_clone/entities/news.dart';
import 'package:new_york_times_clone/view_models/news_view_model.dart';

class NewsService {
  final String _newsPath = 'https://fakenews.squirro.com/news/sport';
  final String _imagePath = 'https://picsum.photos/350/200?random=';

  NewsViewModel news;

  NewsService(this.news);

  Future<void> loadNews() async {
    return http.get(Uri.parse(_newsPath)).then((res) {
      switch (res.statusCode) {
        case 200:
          {
            final newsData =
                News.fromJson(jsonDecode(res.body) as Map<String, dynamic>)
                    .updateNewsImgPath(_imagePath);
            news.update(
                newsData: newsData,
                status: NewsStatus.success,
                errorMesssage: '');
          }
        case _:
          {
            news.update(
                newsData: News.empty(),
                status: NewsStatus.error,
                errorMesssage: 'Failed to load news...');
          }
      }
    }).catchError((e) {
      news.update(
          newsData: News.empty(),
          status: NewsStatus.error,
          errorMesssage: 'Something wrong...');
    });
  }
}
