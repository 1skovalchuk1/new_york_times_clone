import 'package:flutter/material.dart';

class ArticleTime extends StatelessWidget {
  final String timeToRead;
  const ArticleTime({super.key, required this.timeToRead});

  @override
  Widget build(BuildContext context) {
    return Text(timeToRead,
        style: const TextStyle(
            fontSize: 12, 
            color: Colors.grey));
  }
}
