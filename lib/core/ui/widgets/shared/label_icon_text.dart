import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';

class LabelIconText extends StatelessWidget {
  final String label;
  final IconData iconData;
  final String text;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final SizedBox? spacing;
  const LabelIconText({
    Key? key,
    required this.label,
    required this.iconData,
    required this.text,
    this.labelStyle,
    this.textStyle,
    this.spacing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        sizedHeight24,
        Text(
          label,
          style: labelStyle ??
              const TextStyle(
                color: darkPrimary,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
          textAlign: TextAlign.center,
        ),
        spacing ?? sizedHeight48,
        Icon(
          iconData,
          size: iconSize96,
        ),
        spacing ?? sizedHeight48,
        Text(
          text,
          style: textStyle ?? descMedBold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
