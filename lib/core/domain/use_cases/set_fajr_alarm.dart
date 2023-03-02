import 'package:reach_core/core/core.dart' hide NotificationsService, User;

import 'package:deek/core/core.dart';

class SetFajrAlarm extends UseCase<SetFajrAlarmResponse, SetFajrAlarmRequest> {
  final PrayerTimeRepository prayerTimeRepository;
  final NotificationsService notificationsService;
  final UserRepository userRepository;

  SetFajrAlarm({
    required this.prayerTimeRepository,
    required this.notificationsService,
    required this.userRepository,
  });

  @override
  Future<SetFajrAlarmResponse> call(SetFajrAlarmRequest request) async {
    final user = await userRepository.getById("1");

    final fajrTimes =
        await prayerTimeRepository.getFajrTimesFor2Months(user.address);

    final fajrTimeWithVariant = fajrTimes
        .map((time) => time.applyVariant(request.minutesVariant))
        .toList();

    await notificationsService.scheduleFajrAlarms(fajrTimeWithVariant);

    final updatedUser = user.copyWith(
      upcomingAlarms: fajrTimeWithVariant,
      prefferedMinutesVariant: request.minutesVariant,
    );

    await userRepository.update(updatedUser, updatedUser.id);

    return SetFajrAlarmResponse(updatedUser: updatedUser);
  }
}

class SetFajrAlarmRequest {
  final int minutesVariant;

  SetFajrAlarmRequest({
    required this.minutesVariant,
  });
}

class SetFajrAlarmResponse {
  final User updatedUser;
  SetFajrAlarmResponse({
    required this.updatedUser,
  });
}
