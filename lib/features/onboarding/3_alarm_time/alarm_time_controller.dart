import 'package:deek/lib.dart';

class AlarmTimeViewController extends AsyncViewController<User> {
  late final SetFajrAlarm setFajrAlarm;
  AlarmTimeViewController(super.read) : super(viewModelPvdr: userPvdr) {
    setFajrAlarm = read(setFajrAlarmPvdr);
  }

  void onAlarmTimeChanged(int index) {
    read(selectedMinVariationIndexPvdr.notifier).state = index;
  }

  Future<void> onSetAlarm() async {
    emitLoading();
    final selectedIndex = read(selectedMinVariationIndexPvdr);

    final minutesVariant = miniuteVariations[selectedIndex];

    await setFajrAlarm
        .call(SetFajrAlarmRequest(minutesVariant: minutesVariant))
        .then((response) {
      emitData(response.updatedUser);
      // Get.to(HomeScreen())
    });
  }
}

final selectedMinVariationIndexPvdr = StateProvider((ref) => 0);

const miniuteVariations = [
  -15,
  -10,
  0,
  10,
  15,
];

final alarmTimeViewCtrlPvdr =
    Provider((ref) => AlarmTimeViewController(ref.read));
