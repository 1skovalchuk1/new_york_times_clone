import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  final String img;
  const ArticleImage({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(img,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const CircularProgressIndicator()),
      ],
    );
  }
}
