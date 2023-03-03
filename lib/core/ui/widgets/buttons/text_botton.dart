import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';

class TextBotton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const TextBotton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: textButton,
      ),
    );
  }
}
