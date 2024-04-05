import 'package:flutter/material.dart';

class PaddingText extends StatelessWidget {
  final EdgeInsets padding;
  final String text;
  final TextStyle? style;

  const PaddingText(
      {super.key,
      this.padding =
          const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
      required this.text,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
