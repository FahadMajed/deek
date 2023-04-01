import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';
// add icon?

enum FilledBottonStyle { primary, accent }

class FilledBotton extends StatelessWidget {
  const FilledBotton({
    Key? key,
    required this.title,
    this.style = FilledBottonStyle.primary,
    this.isLoading = false,
    required this.onPressed,
  }) : super(key: key);
  final bool isLoading;
  final String title;
  final Function() onPressed;
  final FilledBottonStyle style;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: style == FilledBottonStyle.primary
          ? Theme.of(context).primaryColor
          : darkBlue100,
      borderRadius: radius,
      child: MaterialButton(
        onPressed: isLoading ? null : onPressed,
        minWidth: double.infinity,
        height: 55.0,
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(title,
                style: style == FilledBottonStyle.primary
                    ? FilledBottonPrimary.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).canvasColor,
                      )
                    : FilledBottonAccent),
      ),
    );
  }
}

typedef IntegerCallback = int Function();
