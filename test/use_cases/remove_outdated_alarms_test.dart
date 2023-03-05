import 'package:deek/lib.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test.dart';

void main() async {
  final user = User(position: LongLat.fromMap({}), id: "1", upcomingAlarms: [
    Alarm.fromMap({}),
    Alarm.fromMap({}),
    Alarm.fromMap({}),
    Alarm.fromMap({}),
  ]);
  await userRepoFake.create(
    user,
    "1",
  );

  final SetFajrAlarm setFajrAlarm = SetFajrAlarm(
    prayerTimeRepository: PrayerTimeRepoMock(),
    notificationsService: notificationServiceMock,
    userRepository: userRepoFake,
  );

//needs more cases
  test('should add alarms if least limit reached', () async {
    final updatedUser = await RemoveOutdatedAlarms(
      setFajrAlarm: setFajrAlarm,
      userRepository: userRepoFake,
    ).call();

    assert(updatedUser.upcomingAlarms.length == 6);
    assert(updatedUser.upcomingAlarms.first.id == 1);
  });
}
