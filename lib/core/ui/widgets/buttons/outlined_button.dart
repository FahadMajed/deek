import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';

class OutlinedBotton extends StatelessWidget {
  const OutlinedBotton(
      {Key? key,
      required this.title,
      this.buttonColour = Colors.white,
      this.textColour = darkBlue700,
      required this.onPressed})
      : super(key: key);

  final Color buttonColour;
  final Color textColour;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: buttonColour,
          borderRadius: radius,
          border: Border.all(color: Theme.of(context).primaryColor, width: 1)),
      child: Material(
        color: buttonColour,
        borderRadius: radius,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          height: 53.0,
          child: Text(
            title,
            style: TextStyle(
              color: textColour,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
