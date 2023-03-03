import 'package:deek/core/core.dart';
import 'package:deek/features/home/home_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final User user = User(
    position: LongLat(20, 20),
    id: "1",
    upcomingAlarms: [
      PrayerTime(dateTime: DateTime.now(), id: 1),
    ],
    prefferedMinutesVariant: -15,
  );
  test("should return before fajr by 15", () {
    final homePresenter = HomePresenter(user);
    expect(
      homePresenter.presentViewModel().alarmStatus,
      "امورك طيبة! \nمنبهك مضبوط قبل اذان الفجر بـربع ساعة",
    );
  });
  test("should return before fajr by 10", () {
    final updatedUser = user.copyWith(prefferedMinutesVariant: -10);
    final homePresenter = HomePresenter(updatedUser);
    expect(
      homePresenter.presentViewModel().alarmStatus,
      "منبهك مضبوط قبل اذان الفجر بـعشر دقايق",
    );
  });
  test("should return on fajr", () {
    final updatedUser = user.copyWith(prefferedMinutesVariant: 0);
    final homePresenter = HomePresenter(updatedUser);
    expect(
      homePresenter.presentViewModel().alarmStatus,
      "منبهك مضبوط على وقت الاذان",
    );
  });
  test("should return after fajr by 10", () {
    final updatedUser = user.copyWith(prefferedMinutesVariant: 10);
    final homePresenter = HomePresenter(updatedUser);
    expect(
      homePresenter.presentViewModel().alarmStatus,
      "منبهك مضبوط بعد اذان الفجر بـعشر دقايق",
    );
  });
  test("should return after fajr by 15", () {
    final updatedUser = user.copyWith(prefferedMinutesVariant: 15);
    final homePresenter = HomePresenter(updatedUser);
    expect(
      homePresenter.presentViewModel().alarmStatus,
      "منبهك مضبوط بعد اذان الفجر بـربع ساعة",
    );
  });
}
