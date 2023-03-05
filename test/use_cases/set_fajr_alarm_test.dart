import 'package:deek/lib.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/notification_service_mock.dart';
import '../mocks/prayer_time_repo_mock.dart';
import '../test.dart';

void main() {
  final user = User(
      id: "1",
      position: LongLat(
        -0.1254872,
        51.508515,
      ));
  setUp(
    () => userRepoFake.create(user, "1"),
  );
  test('should set alarm on fajr athan', () async {
    final request = SetFajrAlarmRequest(
      user: user,
      minutesVariant: 0,
    );

    final updatedUser = await SetFajrAlarm(
      userRepository: userRepoFake,
      notificationsService: NotificationServiceMock(),
      prayerTimeRepository: PrayerTimeRepoMock(),
    ).call(request);

    var upcomingAlarms2 = updatedUser.upcomingAlarms;

    expect(upcomingAlarms2.length, 6);
    expect(
      upcomingAlarms2.first.dateTime,
      DateTime(2024, 1, 1, 5, 10),
    );
  });

  test('should set alarm on fajr athan +5', () async {
    final request = SetFajrAlarmRequest(
      user: user,
      minutesVariant: 5,
    );

    final updatedUser = await SetFajrAlarm(
      userRepository: userRepoFake,
      notificationsService: NotificationServiceMock(),
      prayerTimeRepository: PrayerTimeRepoMock(),
    ).call(request);

    expect(updatedUser.prefferedMinutesVariant, 5);
    expect(
      updatedUser.upcomingAlarms.first.dateTime,
      DateTime(2024, 1, 1, 5, 15),
    );
  });

  test('should set alarm on fajr athan -5', () async {
    final request = SetFajrAlarmRequest(
      user: user,
      minutesVariant: -5,
    );

    final updatedUser = await SetFajrAlarm(
      userRepository: userRepoFake,
      notificationsService: NotificationServiceMock(),
      prayerTimeRepository: PrayerTimeRepoMock(),
    ).call(request);

    expect(
      updatedUser.upcomingAlarms.first.dateTime,
      DateTime(2024, 1, 1, 5, 5),
    );
  });
}
