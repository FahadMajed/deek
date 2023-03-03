import 'package:deek/lib.dart';
import 'package:flutter/material.dart';

class AlarmTimePage extends ConsumerWidget {
  const AlarmTimePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewController = ref.watch(alarmTimeViewCtrlPvdr);
    final selectedIndex = ref.watch(selectedMinVariationIndexPvdr);

    return OnboardingPage(
      label: 'وقت المنبة',
      iconData: Icons.alarm,
      desc: 'متى حاب منبهك يرن؟',
      buttonTitle: 'ضبط المنبة',
      widget: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              for (final element in miniuteVariations)
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: element == miniuteVariations.last ? 0 : 4.0),
                    child: SelectableTextContainer(
                      onTap: () => viewController.onAlarmTimeChanged(
                          miniuteVariations.indexOf(element)),
                      isChosen: miniuteVariations[selectedIndex] == element,
                      text:
                          _getVariationName(miniuteVariations.indexOf(element)),
                    ),
                  ),
                ),
            ],
          ),
          sizedHeight32,
        ],
      ),
      onPressed: viewController.onSetAlarm,
    );
  }

  String _getVariationName(int element) {
    switch (element) {
      case 0:
        return "-15د";
      case 1:
        return "-10د";
      case 2:
        return "مع الاذان";
      case 3:
        return "+10د";
      case 4:
        return "+15د";
      default:
        return "";
    }
  }
}
