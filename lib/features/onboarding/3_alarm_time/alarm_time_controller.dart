import 'package:deek/features/home/home_screen.dart';
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
    final userRef = viewModelAsData;
    emitLoading();
    final selectedIndex = read(selectedMinVariationIndexPvdr);

    final minutesVariant = miniuteVariations[selectedIndex];

    await setFajrAlarm
        .call(SetFajrAlarmRequest(
      minutesVariant: minutesVariant,
      user: userRef,
    ))
        .then((updatedUser) {
      emitData(updatedUser);
      Get.to(const HomeScreen());
    });
  }
}

final selectedMinVariationIndexPvdr = StateProvider((ref) => 2);

const miniuteVariations = [
  -15,
  -10,
  0,
  10,
  15,
];

final alarmTimeViewCtrlPvdr =
    Provider((ref) => AlarmTimeViewController(ref.read));
