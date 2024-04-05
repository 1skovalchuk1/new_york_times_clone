import 'package:flutter/material.dart';
import 'package:new_york_times_clone/entities/article.dart';
import 'package:new_york_times_clone/entities/news.dart';
import 'package:new_york_times_clone/services/news_service.dart';

enum NewsStatus<T> { success, loading, error }

class NewsViewModel extends ChangeNotifier {
  Article currentArticle = Article.empty();
  News newsData = News.empty();
  NewsStatus status = NewsStatus.loading;
  String errorMesssage = '';

  void setCurrentArticle(Article article) {
    currentArticle = article;
  }

  void init() {
    NewsService(this).loadNews();
  }

  void update({required News newsData, required NewsStatus status, required String errorMesssage}) {
    this.newsData = newsData;
    this.status = status;
    this.errorMesssage = errorMesssage;
    notifyListeners();
  }
}
