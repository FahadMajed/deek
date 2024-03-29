import 'package:deek/core/ui/ui.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String desc;
  final Widget? widget;
  final String buttonTitle;
  final Future<void> Function() onPressed;

  const OnboardingPage({
    super.key,
    required this.iconData,
    required this.label,
    required this.desc,
    this.widget,
    required this.buttonTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelIconText(
          iconData: iconData,
          label: label,
          text: desc,
        ),
        sizedHeight48,
        widget ?? Container(),
        sizedHeight32,
        FilledBotton(
          title: buttonTitle,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
