import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';
import 'package:sizer/sizer.dart';

class CupertinoBSContainer extends StatelessWidget {
  final Widget child;

  const CupertinoBSContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.w,
      color: const Color(0xff737373),
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Container(
              padding: padding20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: 60.w,
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
