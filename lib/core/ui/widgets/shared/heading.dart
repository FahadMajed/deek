import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';

class Heading extends StatelessWidget {
  final String h4;
  final String h5;

  final String h6;

  final bool hasDivider;

  const Heading({
    Key? key,
    required this.h5,
    required this.h6,
    this.hasDivider = true,
    this.h4 = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (h4.isNotEmpty) ...[
          Center(
            child: Text(
              h4,
              style: titleLargeBold,
            ),
          ),
          sizedHeight4
        ],
        Text(
          h5,
          style: titleMidBold,
        ),
        sizedHeight4,
        if (h6.isNotEmpty)
          Text(
            h6,
            style: descMed,
          ),
        if (hasDivider) divider32
      ],
    );
  }
}
