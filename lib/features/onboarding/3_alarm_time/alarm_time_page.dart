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
      iconData: Icons.notifications,
      desc: 'متى حاب منبهك يرن؟',
      buttonTitle: 'ضبط المنبة',
      widget: Flex(
        direction: Axis.horizontal,
        children: [
          //page e.g. Days, element e.g. Sun
          for (final element in miniuteVariations)
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                    right: element == miniuteVariations.last ? 0 : 2.0),
                child: SelectableTextContainer(
                  onTap: () => viewController
                      .onAlarmTimeChanged(miniuteVariations.indexOf(element)),
                  isChosen: selectedIndex == element,
                  text: _getVariationName(element),
                ),
              ),
            ),
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
