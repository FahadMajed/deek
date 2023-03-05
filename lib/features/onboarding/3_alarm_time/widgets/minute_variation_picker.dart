import 'package:deek/features/features.dart';
import 'package:flutter/material.dart';

class MinuteVariationPicker extends StatelessWidget {
  final Function(int) onChanged;
  final int selectedIndex;
  final TextStyle? style;

  const MinuteVariationPicker({
    Key? key,
    required this.onChanged,
    required this.selectedIndex,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        for (final element in miniuteVariations)
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                  left: element == miniuteVariations.last ? 0 : 4.0),
              child: SelectableTextContainer(
                style: style,
                onTap: () => onChanged(element),
                isChosen: miniuteVariations[selectedIndex] == element,
                text: _getVariationName(miniuteVariations.indexOf(element)),
              ),
            ),
          ),
      ],
    );
  }

  String _getVariationName(int element) {
    switch (element) {
      case 0:
        return "-15د";
      case 1:
        return "-10د";
      case 2:
        return "مع الاذان";
      case 3:
        return "+10د";
      case 4:
        return "+15د";
      default:
        return "";
    }
  }
}
