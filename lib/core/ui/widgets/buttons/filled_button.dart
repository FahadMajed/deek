import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';
// add icon?

enum FilledButtonStyle { primary, accent }

class FilledButton extends StatelessWidget {
  const FilledButton({
    Key? key,
    required this.title,
    this.style = FilledButtonStyle.primary,
    this.isLoading = false,
    required this.onPressed,
  }) : super(key: key);
  final bool isLoading;
  final String title;
  final Function() onPressed;
  final FilledButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: style == FilledButtonStyle.primary
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
                style: style == FilledButtonStyle.primary
                    ? filledButtonPrimary.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).canvasColor,
                      )
                    : filledButtonAccent),
      ),
    );
  }
}

typedef IntegerCallback = int Function();
