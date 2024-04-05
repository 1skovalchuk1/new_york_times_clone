import 'package:flutter/material.dart';
import 'package:new_york_times_clone/entities/article.dart';
import 'package:new_york_times_clone/widgets/article_items/article_abstract.dart';
import 'package:new_york_times_clone/widgets/article_items/article_author.dart';
import 'package:new_york_times_clone/widgets/article_items/article_headline.dart';
import 'package:new_york_times_clone/widgets/article_items/article_image.dart';
import 'package:new_york_times_clone/widgets/article_items/article_time.dart';

class ArticlePreview extends StatelessWidget {
  final Article article;

  const ArticlePreview({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 360),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArticleHeadline(headline: article.headline),
          const SizedBox(height: 5),
          ArticleAbstract(abstract: article.abstract),
          const SizedBox(height: 5),
          ArticleTime(timeToRead: article.timeToRead),
          const SizedBox(height: 7),
          ArticleImage(img: article.img),
          const SizedBox(height: 3),
          ArticleAuthor(author: article.author),
          const Divider(
              color: Color.fromARGB(255, 120, 120, 120),
              height: 20,
              thickness: 0.2),
        ],
      ),
    );
  }
}
