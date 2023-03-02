import 'package:deek/core/domain/use_cases/mark_alarm_seen.dart';
import 'package:deek/lib.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/notification_service_mock.dart';
import 'mocks/prayer_time_repo_mock.dart';
import 'mocks/user_repo_mock.dart';

void main() async {
  await userRepoFake.create(
    User(
      address: Address.fromMap({}),
      id: "1",
    ),
    "1",
  );

  final SetFajrAlarm setFajrAlarm = SetFajrAlarm(
    prayerTimeRepository: PrayerTimeRepoMock(),
    notificationsService: notificationServiceMock,
    userRepository: userRepoFake,
  );
  setUp(() async =>
      await setFajrAlarm.call(SetFajrAlarmRequest(minutesVariant: 0)));

  test('should remove current alarm', () async {
    final user = await userRepoFake.getById("1");
    assert(user.upcomingAlarms.length == 6);
    assert(user.upcomingAlarms.first.id == 1);
    final updatedUser = await MarkAlarmSeen(
      setFajrAlarm: setFajrAlarm,
      userRepository: userRepoFake,
    ).call();
  });

  test('should add alarms if least limit reached', () async {
    final user = await userRepoFake.getById("1");
    await userRepoFake.update(
        user.copyWith(upcomingAlarms: [PrayerTime.fromMap({})]), "1");

    final updatedUser = await MarkAlarmSeen(
      setFajrAlarm: setFajrAlarm,
      userRepository: userRepoFake,
    ).call();

    assert(updatedUser.upcomingAlarms.length == 6);
    assert(updatedUser.upcomingAlarms.first.id == 1);
  });
}
