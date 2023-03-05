import 'package:deek/lib.dart';

import 'package:flutter/material.dart';

class SettingTileContainer extends StatelessWidget {
  const SettingTileContainer({
    Key? key,
    required this.onTap,
    required this.tile,
    required this.checkBoxValue,
  }) : super(key: key);

  final Function(Setting) onTap;
  final SettingTile tile;

  final bool checkBoxValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: lightPrimary,
        borderRadius: radius,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () => onTap(tile.setting),
        contentPadding: const EdgeInsets.only(right: 8),
        leading: Text(
          tile.title,
          style: descMedBold,
        ),
        trailing: tile.isCheckbox
            ? Checkbox(
                activeColor: primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                ),
                value: checkBoxValue,
                onChanged: (_) => onTap(tile.setting),
              )
            : const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: darkPrimary,
                ),
              ),
      ),
    );
  }
}
