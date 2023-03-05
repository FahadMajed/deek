import 'package:deek/features/settings/settings_router.dart';
import 'package:deek/lib.dart';

class SettingsViewController extends AsyncViewController<User> {
  late final UserRepository userRepository;
  late final SetFajrAlarm setFajrAlarm;
  late final TurnOffAlarms turnOffAlarms;
  late final SetUserCurrentLocation setUserCurrentLocation;
  final screenRouter = SettingsRouter();

  SettingsViewController(super.read) : super(viewModelPvdr: userPvdr) {
    userRepository = read(userRepoPvdr);
    setFajrAlarm = read(setFajrAlarmPvdr);
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
          user: userRef,
        ),
      );
      emitData(updatedUser);
    }
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
    final userRef = user;

    emitLoading();
    await setFajrAlarm
        .call(
      SetFajrAlarmRequest(
        minutesVariant: minutesVariant,
        user: userRef,
      ),
    )
        .then((updatedUser) {
      emitData(updatedUser);
      screenRouter.oAlarmEditedSucess();
    });
  }

  void _onChangeLocation() async {
    final userRef = user;
    emitLoading();
    final updatedUserLocation = await setUserCurrentLocation.call(userRef);

    await setFajrAlarm
        .call(SetFajrAlarmRequest(
      minutesVariant: updatedUserLocation.prefferedMinutesVariant,
      user: updatedUserLocation,
    ))
        .then((updatedUser) {
      emitData(updatedUser);
      screenRouter.onLocationChangeSuccess();
    });
  }
}

final settingsViewCtrlPvdr =
    Provider((ref) => SettingsViewController(ref.read));
