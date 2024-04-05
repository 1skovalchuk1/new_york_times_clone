import 'package:flutter/material.dart';

class ArticleAbstract extends StatelessWidget {
  final String abstract;
  const ArticleAbstract({super.key, required this.abstract});

  @override
  Widget build(BuildContext context) {
    return Text(abstract,
        style: const TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ));
  }
}
