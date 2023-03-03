import 'package:deek/core/core.dart';
import 'package:flutter/material.dart';

class SelectableTextContainer extends StatelessWidget {
  final bool isChosen;
  final String text;
  final VoidCallback onTap;
  final double height;
  const SelectableTextContainer({
    Key? key,
    required this.onTap,
    required this.isChosen,
    required this.text,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: isChosen ? secondaryColor : Colors.white,
            borderRadius: radius,
            border: Border.all(color: Colors.black, width: 0.5)),
        child: Center(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
