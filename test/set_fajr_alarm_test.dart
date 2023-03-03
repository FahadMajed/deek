import 'package:deek/lib.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/notification_service_mock.dart';
import 'mocks/prayer_time_repo_mock.dart';
import 'mocks/user_repo_mock.dart';

void main() {
  setUp(
    () => userRepoFake.create(
        User(
            id: "1",
            position: LongLat(
              -0.1254872,
              51.508515,
            )),
        "1"),
  );
  test('should set alarm on fajr athan', () async {
    final request = SetFajrAlarmRequest(
      minutesVariant: 0,
    );

    final response = await SetFajrAlarm(
      userRepository: userRepoFake,
      notificationsService: NotificationServiceMock(),
      prayerTimeRepository: PrayerTimeRepoMock(),
    ).call(request);

    var upcomingAlarms2 = response.updatedUser.upcomingAlarms;

    expect(upcomingAlarms2.length, 6);
    expect(
      upcomingAlarms2.first.dateTime,
      DateTime(2022, 1, 1, 5, 10),
    );
  });

  test('should set alarm on fajr athan +5', () async {
    final request = SetFajrAlarmRequest(
      minutesVariant: 5,
    );

    final response = await SetFajrAlarm(
      userRepository: userRepoFake,
      notificationsService: NotificationServiceMock(),
      prayerTimeRepository: PrayerTimeRepoMock(),
    ).call(request);

    expect(response.updatedUser.prefferedMinutesVariant, 5);
    expect(
      response.updatedUser.upcomingAlarms.first.dateTime,
      DateTime(2022, 1, 1, 5, 15),
    );
  });

  test('should set alarm on fajr athan -5', () async {
    final request = SetFajrAlarmRequest(
      minutesVariant: -5,
    );

    final response = await SetFajrAlarm(
      userRepository: userRepoFake,
      notificationsService: NotificationServiceMock(),
      prayerTimeRepository: PrayerTimeRepoMock(),
    ).call(request);

    expect(
      response.updatedUser.upcomingAlarms.first.dateTime,
      DateTime(2022, 1, 1, 5, 5),
    );
  });
}
