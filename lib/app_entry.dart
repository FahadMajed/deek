import 'package:deek/lib.dart';

import 'package:flutter/material.dart';

class DeekEntry extends ConsumerWidget {
  const DeekEntry({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userPvdr);

    return GetMaterialApp(
      locale: const Locale("ar", "SA"),
      navigatorObservers: [
        routeObserver,
      ],
      onInit: () async {
        final read = ref.read;
        read(userPvdr.notifier).state =
            AsyncData(await read(markAlarmSeenPvdr)());
      },
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: user.isLoading
          ? const LoadingScaffold()
          : user.value?.isNotDefault ?? false
              ? const HomeScreen()
              : const DeekLanding(),
    );
  }

  ThemeData getThemeData() {
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: textButtonStyle,
      ),
      scaffoldBackgroundColor: nuteralColor,
      listTileTheme: const ListTileThemeData(
        iconColor: actionIconColor,
      ),
      buttonTheme: const ButtonThemeData(
        padding: EdgeInsets.symmetric(horizontal: 0),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black, size: iconSize20),
        centerTitle: true,
        titleTextStyle: appBar,
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      snackBarTheme: snackBarTheme,
      inputDecorationTheme: inputDecorationTheme,
      iconTheme: const IconThemeData(color: secondayColor),
      fontFamily: "IBM-Sans",
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          secondary: secondayColor,
          background: nuteralColor),
      backgroundColor: nuteralColor,
      primaryIconTheme: const IconThemeData(color: secondayColor),
    );
  }
}
