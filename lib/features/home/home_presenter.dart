import 'package:deek/lib.dart';
import 'package:flutter/material.dart';

final homeViewModelPvdr = Provider<AsyncValue<HomeViewModel>>((ref) {
  final user = ref.watch(userPvdr);
  return user.whenData(
    (user) => HomePresenter(user).presentViewModel(),
  );
});

class HomePresenter implements Presenter<HomeViewModel> {
  final User user;

  HomePresenter(this.user);

  @override
  HomeViewModel presentViewModel() {
    if (_userHasAlarms) {
      return HomeViewModel(
        label: 'وقت المنبه',
        iconData: Icons.alarm,
        alarmTime: _getAlarmTime(),
        alarmStatus:
            "امورك طيبة! \n${_getActiveAlarmStatus(user.prefferedMinutesVariant)}",
      );
    } else {
      return HomeViewModel(
        label: 'ما فيه منبهات',
        iconData: Icons.bed,
        alarmTime: "-",
        alarmStatus: "تقدر تجدول المنبهات من جديد",
      );
    }
  }

  bool get _userHasAlarms => user.hasAlarms;

  String _getActiveAlarmStatus(int prefferedMinutesVariant) {
    if (prefferedMinutesVariant == 0) {
      return "منبهك مضبوط على وقت الاذان";
    }

    final String alarmPosition =
        prefferedMinutesVariant.isNegative ? "قبل" : "بعد";
    final String minutes =
        (prefferedMinutesVariant == 10 || prefferedMinutesVariant == -10)
            ? "عشر دقايق"
            : "ربع ساعة";

    return 'منبهك مضبوط $alarmPosition اذان الفجر بـ$minutes';
  }

  String _getAlarmTime() {
    var upcomingAlarm = user.upcomingAlarms.first.dateTime;
    String zero = upcomingAlarm.minute < 10 ? "0" : "";
    return "${upcomingAlarm.hour}:$zero${upcomingAlarm.minute}";
  }
}
