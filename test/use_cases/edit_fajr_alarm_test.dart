import 'package:deek/core/domain/use_cases/edit_fajr_alarms.dart';
import 'package:deek/lib.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/notification_service_mock.dart';
import '../test.dart';

void main() {
  DateTime getDate({required int minute}) => DateTime(2222, 1, 1, 5, minute);

  final user = User.empty().copyWith(
    upcomingAlarms: [
      PrayerTime(dateTime: getDate(minute: 10), id: 1),
      PrayerTime(dateTime: getDate(minute: 12), id: 2),
    ],
    prefferedMinutesVariant: 0,
  );

  setUp(() async {
    await userRepoFake.create(user, user.id);
  });

  final editFajrAlarm = EditFajrAlarm(
    notificationsService: notificationServiceMock,
    userRepository: userRepoFake,
  );
  test('should change from 0 to 15', () async {
    final request = EditFajrAlarmRequest(
      minutesVariant: 15,
      user: user,
    );
    final updatedUser = await editFajrAlarm.call(request);
    expect(updatedUser.upcomingAlarms, [
      PrayerTime(dateTime: getDate(minute: 10 + 15), id: 1),
      PrayerTime(dateTime: getDate(minute: 12 + 15), id: 2),
    ]);
  });

  test('should change from 0 to -15', () async {
    final request = EditFajrAlarmRequest(
      minutesVariant: -15,
      user: user,
    );
    final updatedUser = await editFajrAlarm.call(request);
    expect(updatedUser.upcomingAlarms, [
      PrayerTime(dateTime: getDate(minute: 10 - 15), id: 1),
      PrayerTime(dateTime: getDate(minute: 12 - 15), id: 2),
    ]);
  });

  test('should change from -15 to 0', () async {
    final request = EditFajrAlarmRequest(
      minutesVariant: 0,
      user: user.copyWith(prefferedMinutesVariant: -15),
    );

    final updatedUser = await editFajrAlarm.call(request);
    expect(updatedUser.upcomingAlarms, [
      PrayerTime(dateTime: getDate(minute: 10 + 15), id: 1),
      PrayerTime(dateTime: getDate(minute: 12 + 15), id: 2),
    ]);
  });

  test('should change from 15 to 0', () async {
    final request = EditFajrAlarmRequest(
      minutesVariant: 0,
      user: user.copyWith(prefferedMinutesVariant: 15),
    );

    final updatedUser = await editFajrAlarm.call(request);
    expect(updatedUser.upcomingAlarms, [
      PrayerTime(dateTime: getDate(minute: 10 - 15), id: 1),
      PrayerTime(dateTime: getDate(minute: 12 - 15), id: 2),
    ]);
  });

  test('should change from 15 to 10', () async {
    final request = EditFajrAlarmRequest(
      minutesVariant: 10,
      user: user.copyWith(prefferedMinutesVariant: 15),
    );

    final updatedUser = await editFajrAlarm.call(request);
    expect(updatedUser.upcomingAlarms, [
      PrayerTime(dateTime: getDate(minute: 10 - 5), id: 1),
      PrayerTime(dateTime: getDate(minute: 12 - 5), id: 2),
    ]);
  });

  test('should change from 15 to -10', () async {
    final request = EditFajrAlarmRequest(
      minutesVariant: -10,
      user: user.copyWith(prefferedMinutesVariant: 15),
    );

    final updatedUser = await editFajrAlarm.call(request);
    expect(updatedUser.upcomingAlarms, [
      PrayerTime(dateTime: getDate(minute: 10 - 25), id: 1),
      PrayerTime(dateTime: getDate(minute: 12 - 25), id: 2),
    ]);
  });

  test('should change from -15 to -10', () async {
    final request = EditFajrAlarmRequest(
      minutesVariant: -10,
      user: user.copyWith(prefferedMinutesVariant: -15),
    );

    final updatedUser = await editFajrAlarm.call(request);
    expect(updatedUser.upcomingAlarms, [
      PrayerTime(dateTime: getDate(minute: 10 + 5), id: 1),
      PrayerTime(dateTime: getDate(minute: 12 + 5), id: 2),
    ]);
  });
  test('should change from -10 to -15', () async {
    final request = EditFajrAlarmRequest(
      minutesVariant: -15,
      user: user.copyWith(prefferedMinutesVariant: -10),
    );

    final updatedUser = await editFajrAlarm.call(request);
    expect(updatedUser.upcomingAlarms, [
      PrayerTime(dateTime: getDate(minute: 10 - 5), id: 1),
      PrayerTime(dateTime: getDate(minute: 12 - 5), id: 2),
    ]);
  });
}
