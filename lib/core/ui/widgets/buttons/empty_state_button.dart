import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';

import 'filled_button.dart';

class EmptyStateContainer extends StatelessWidget {
  final String text;
  final String buttonTitle;
  final Function() onButtonPressed;
  final IconData iconData;

  const EmptyStateContainer(
      {Key? key,
      required this.text,
      required this.buttonTitle,
      required this.iconData,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizedHeight24,
        sizedHeight24,
        Text(
          text,
          style: titleLargeBold.copyWith(color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        sizedHeight24,
        Icon(
          iconData,
          size: iconSize48,
        ),
        sizedHeight24,
        FilledBotton(
          title: buttonTitle,
          onPressed: onButtonPressed,
          style: FilledBottonStyle.accent,
        )
      ],
    );
  }
}
