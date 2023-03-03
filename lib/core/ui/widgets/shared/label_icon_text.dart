import 'package:deek/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';

class LabelIconText extends StatelessWidget {
  final String label;
  final IconData iconData;
  final String text;

  const LabelIconText({
    Key? key,
    required this.label,
    required this.iconData,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        sizedHeight24,
        Text(
          label,
          style: const TextStyle(
            color: darkPrimary,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        sizedHeight48,
        Icon(
          iconData,
          size: iconSize96,
        ),
        sizedHeight48,
        Text(
          text,
          style: descMedBold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
