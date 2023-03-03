import 'package:deek/lib.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

import 'app_entry.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("user");

  runApp(
    Sizer(
      builder: (_, __, ___) => const ProviderScope(
        overrides: [],
        child: DeekEntry(),
      ),
    ),
  );
}
