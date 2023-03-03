import 'package:flutter/material.dart';
import 'package:deek/core/ui/theme/theme.dart';
import 'package:sizer/sizer.dart';

class BottomSheetContainer extends StatelessWidget {
  final List<Widget> children;
  final bool showCross;
  final double? height;
  final CrossAxisAlignment alignment;
  const BottomSheetContainer(
      {Key? key,
      required this.children,
      this.alignment = CrossAxisAlignment.center,
      this.height,
      this.showCross = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff757575),
      child: Container(
        padding: padding16,
        height: height == null ? 50.h : height!.h,
        decoration: bsDecoration(context),
        child: Column(
          crossAxisAlignment: alignment,
          mainAxisSize: MainAxisSize.min,
          children: [if (showCross) buildCross(context), ...children],
        ),
      ),
    );
  }

  buildCross(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.clear,
            size: iconSize20,
          ),
        ),
      );
}

class BottomSheetScrollable extends StatelessWidget {
  final List<Widget> children;
  final bool showCross;
  final double? height;
  final CrossAxisAlignment alignment;

  const BottomSheetScrollable(
      {Key? key,
      required this.children,
      this.height,
      this.showCross = true,
      this.alignment = CrossAxisAlignment.center})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BottomSheetContainer(
          height: height,
          showCross: showCross,
          alignment: alignment,
          children: children,
        ),
      ),
    );
  }
}

bsDecoration(context) => BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    );

buildCross(BuildContext context) => Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.clear,
          size: 25,
        ),
      ),
    );
