import 'package:flutter/material.dart';
import 'package:new_york_times_clone/article.dart';
import 'package:new_york_times_clone/entities/article.dart';
import 'package:new_york_times_clone/view_models/news_view_model.dart';
import 'package:new_york_times_clone/widgets/article_items/article_preview.dart';
import 'package:provider/provider.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ArticleWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 2);
      const end = Offset.zero;

      var tween = Tween(begin: begin, end: end);

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class TodayWidget extends StatefulWidget {
  const TodayWidget({super.key});

  @override
  State<TodayWidget> createState() => _TodayWidgetState();
}

class _TodayWidgetState extends State<TodayWidget> {
  @override
  void initState() {
    super.initState();
    context.read<NewsViewModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final status = context.watch<NewsViewModel>().status;

    final newsline = switch (status) {
      NewsStatus.success => ListView(
          padding: const EdgeInsets.all(5),
          children: context
              .watch<NewsViewModel>()
              .newsData
              .news
              .map((Article i) => GestureDetector(
                  onTap: () {
                    context.read<NewsViewModel>().setCurrentArticle(i);
                    Navigator.of(context).push(_createRoute());
                  },
                  child: ArticlePreview(article: i)))
              .toList(),
        ),
      NewsStatus.loading => const CircularProgressIndicator(),
      NewsStatus.error => Text(context.watch<NewsViewModel>().errorMesssage),
    };

    return Center(child: newsline);
  }
}
