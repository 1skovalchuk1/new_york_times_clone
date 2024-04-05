import 'package:flutter/material.dart';

class ArticleHeadline extends StatelessWidget {
  final String headline;
  final bool isPreview;
  const ArticleHeadline({super.key, required this.headline, this.isPreview = false});

  @override
  Widget build(BuildContext context) {
    return Text(headline,
        style: TextStyle(
          fontStyle: isPreview ? FontStyle.italic : FontStyle.normal,
            fontFamily: 'Times New Roman',
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.black));
  }
}
