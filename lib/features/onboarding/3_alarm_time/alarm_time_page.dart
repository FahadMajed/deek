import 'package:flutter/material.dart';

import 'package:deek/lib.dart';

class AlarmTimePage extends ConsumerWidget {
  const AlarmTimePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewController = ref.watch(alarmTimeViewCtrlPvdr);
    final selectedIndex = ref.watch(selectedMinVariationIndexPvdr);

    return OnboardingPage(
      label: 'وقت المنبه',
      iconData: Icons.alarm,
      desc: 'متى حاب منبهك يرن؟',
      buttonTitle: 'ضبط المنبه',
      widget: Column(
        children: [
          MinuteVariationPicker(
            onChanged: (element) => viewController.onAlarmTimeChanged(
              miniuteVariations.indexOf(element),
            ),
            selectedIndex: selectedIndex,
          ),
          sizedHeight32,
        ],
      ),
      onPressed: viewController.onSetAlarm,
    );
  }
}
