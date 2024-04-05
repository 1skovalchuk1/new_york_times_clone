import 'package:flutter/material.dart';

class ArticleAuthor extends StatelessWidget {
  final String author;
  const ArticleAuthor({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(author,
            style: const TextStyle(
                fontSize: 10, color: Colors.grey))
      ],
    );
  }
}
