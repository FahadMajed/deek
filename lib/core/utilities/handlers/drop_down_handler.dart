import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';

import '../ui_utils/size.dart';

class DropDownHandler {
  static Future showDropDown(
      {required List items, required Function(int)? onChanged}) {
    String selectedItem = items[0];
    List<Text> pickerItems = [];
    for (String item in items) {
      pickerItems.add(Text(item));
    }

    if (Platform.isIOS) {
      return showModalBottomSheet(
        context: Get.overlayContext!,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: getDeviceHeight(context) * 0.25,
            child: CupertinoPicker(
              onSelectedItemChanged: onChanged,
              itemExtent: 32.0,
              children: pickerItems,
            ),
          );
        },
      );
    } else {
      return Future.value();
      // return showMaterialScrollPicker(
      //   context: Get.overlayContext!,
      //   title: '',
      //   items: items,
      //   selectedItem: selectedItem,
      //   onChanged: (value) => selectedItem = items[value],
      // );
    }
  }
}
