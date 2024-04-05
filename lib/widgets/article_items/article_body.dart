import 'package:flutter/material.dart';

class ArticleBody extends StatelessWidget {
  final String body;
  const ArticleBody({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Text(body,
        style: const TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ));
  }
}