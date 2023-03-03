import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';
import 'package:sizer/sizer.dart';

class BottomButton extends StatelessWidget {
  final Function() onPressed;
  final Function()? fallBack;
  final bool isActive;
  final String title;
  final double? height;

  const BottomButton({
    Key? key,
    required this.onPressed,
    this.fallBack,
    this.title = 'cont',
    this.height,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isActive ? Theme.of(context).primaryColor : Colors.grey,
      width: double.infinity,
      height: 10.h,
      child: TextButton(
        onPressed: isActive
            ? onPressed
            : () {
                fallBack?.call();
              },
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
