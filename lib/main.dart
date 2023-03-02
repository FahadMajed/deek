import 'package:flutter/material.dart';

void main() {
  runApp(const Deek());
}

class Deek extends StatelessWidget {
  const Deek({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
