import 'package:deek/core/ui/widgets/shared/reach_scaffold.dart';
import 'package:flutter/material.dart';

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold(
    this.e, {
    Key? key,
  }) : super(key: key);
  final Object e;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      withWhiteContainer: true,
      body: [ErrorWidget(e)],
    );
  }
}
