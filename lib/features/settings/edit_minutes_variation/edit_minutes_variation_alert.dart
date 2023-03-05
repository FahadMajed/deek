import 'package:deek/lib.dart';
import 'package:flutter/material.dart';

class EditMinutesVariation extends ConsumerWidget {
  const EditMinutesVariation({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewController = ref.watch(settingsViewCtrlPvdr);
    final selectedIndex = ref.watch(selectedMinVariationIndexPvdr);
    return Column(
      children: [
        const Text("تعديل وقت المنبه"),
        sizedHeight32,
        MinuteVariationPicker(
          onChanged: viewController.onMinutesVariationChanged,
          selectedIndex: selectedIndex,
          style: subtitleSmall.copyWith(color: Colors.white),
        ),
        sizedHeight32,
      ],
    );
  }
}
