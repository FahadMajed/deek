import 'package:deek/core/core.dart';
import 'package:deek/features/home/home_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final User user = User(
    position: LongLat(20, 20),
    id: "1",
    upcomingAlarms: [
      Alarm(dateTime: DateTime.now(), id: 1),
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
    final updatedUser = user.setMinutesVariant(-10);
    final homePresenter = HomePresenter(updatedUser);
    expect(
      homePresenter.presentViewModel().alarmStatus.contains(
            "منبهك مضبوط قبل اذان الفجر بـعشر دقايق",
          ),
      true,
    );
  });
  test("should return on fajr", () {
    final updatedUser = user.setMinutesVariant(0);
    final homePresenter = HomePresenter(updatedUser);
    expect(
      homePresenter.presentViewModel().alarmStatus.contains(
            "منبهك مضبوط على وقت الاذان",
          ),
      true,
    );
  });
  test("should return after fajr by 10", () {
    final updatedUser = user.setMinutesVariant(10);
    final homePresenter = HomePresenter(updatedUser);
    expect(
      homePresenter.presentViewModel().alarmStatus.contains(
            "منبهك مضبوط بعد اذان الفجر بـعشر دقايق",
          ),
      true,
    );
  });
  test("should return after fajr by 15", () {
    final updatedUser = user.setMinutesVariant(15);
    final homePresenter = HomePresenter(updatedUser);
    expect(
      homePresenter.presentViewModel().alarmStatus.contains(
            "منبهك مضبوط بعد اذان الفجر بـربع ساعة",
          ),
      true,
    );
  });
}
