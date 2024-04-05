import 'package:flutter/material.dart';
import 'package:new_york_times_clone/entities/article.dart';
import 'package:new_york_times_clone/view_models/news_view_model.dart';
import 'package:new_york_times_clone/widgets/article_items/article_author.dart';
import 'package:new_york_times_clone/widgets/article_items/article_body.dart';
import 'package:new_york_times_clone/widgets/article_items/article_headline.dart';
import 'package:new_york_times_clone/widgets/article_items/article_image.dart';
import 'package:provider/provider.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    final Article article = context.watch<NewsViewModel>().currentArticle;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0),
      ),
      backgroundColor: color,
      body: ListView(padding: const EdgeInsets.all(12), children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArticleHeadline(
                headline: article.headline,
                isPreview: true,
              ),
              const SizedBox(height: 7),
              ArticleImage(img: article.img),
              const SizedBox(height: 10),
              ArticleBody(body: article.body),
              const SizedBox(height: 3),
              ArticleAuthor(author: article.author),
              const Divider(
                  color: Color.fromARGB(255, 120, 120, 120),
                  height: 40,
                  thickness: 0.2),
            ],
          ),
        ),
      ]),
    );
  }
}
