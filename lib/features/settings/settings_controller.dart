import 'package:deek/core/domain/use_cases/edit_fajr_alarms.dart';
import 'package:deek/features/settings/settings_router.dart';
import 'package:deek/lib.dart';

class SettingsViewController extends AsyncViewController<User> {
  late final SetFajrAlarm setFajrAlarm;
  late final EditFajrAlarm editFajrAlarm;
  late final TurnOffAlarms turnOffAlarms;
  late final SetUserCurrentLocation setUserCurrentLocation;

  final screenRouter = SettingsRouter();

  SettingsViewController(super.read) : super(viewModelPvdr: userPvdr) {
    setFajrAlarm = read(setFajrAlarmPvdr);
    editFajrAlarm = read(editFajrAlarmPvdr);
    turnOffAlarms = read(turnOffAlarmsPvdr);
    setUserCurrentLocation = read(setUserLocationPvdr);
  }

  void onMinutesVariationChanged(int minuteVariant) {
    setSelectedVariantIndex(minuteVariant);
  }

  void onTileTap(Setting setting) async {
    switch (setting) {
      case Setting.switchAlarm:
        return _onSwitchAlarm();

      case Setting.editVariation:
        return _onEditVariation();
      case Setting.changeLocation:
        return _onChangeLocation();
      case Setting.changeSound:
        DiaIog.show(title: "ما برمجناها لسى :)");
        return;

      default:
    }
  }

  void _onSwitchAlarm() async {
    if (user.hasAlarms) {
      final updatedUser = await turnOffAlarms.call();
      emitData(updatedUser);
    } else {
      final userRef = user;

      emitLoading();

      final updatedUser = await setFajrAlarm.call(
        SetFajrAlarmRequest(
          minutesVariant: userRef.prefferedMinutesVariant,
        ),
      );
      emitData(updatedUser);
    }
    screenRouter.onAlarmSwitched(user.hasAlarms);
  }

  void _onEditVariation() {
    setSelectedVariantIndex(user.prefferedMinutesVariant);
    screenRouter.showEdit(onSave: _saveEditedAlarm);
  }

  void setSelectedVariantIndex(int minutesVariant) =>
      read(selectedMinVariationIndexPvdr.notifier).state =
          miniuteVariations.indexOf(minutesVariant);

  void _saveEditedAlarm() async {
    final selectedIndex = read(selectedMinVariationIndexPvdr);

    final minutesVariant = miniuteVariations[selectedIndex];

    emitLoading();
    await editFajrAlarm
        .call(
      EditFajrAlarmRequest(
        minutesVariant: minutesVariant,
      ),
    )
        .then((updatedUser) {
      emitData(updatedUser);
      screenRouter.oAlarmEditedSucess();
    });
  }

  void _onChangeLocation() async {
    emitLoading();
    final updatedUser = await setUserCurrentLocation.call();

    await setFajrAlarm
        .call(SetFajrAlarmRequest(
      minutesVariant: updatedUser.prefferedMinutesVariant,
    ))
        .then((updatedUser) {
      emitData(updatedUser);
      screenRouter.onLocationChangeSuccess();
    });
  }
}

final settingsViewCtrlPvdr =
    Provider((ref) => SettingsViewController(ref.read));
