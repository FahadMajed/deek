import 'package:deek/lib.dart';

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
    final user = request.user;
    print(user);
    final fajrTimes =
        await prayerTimeRepository.getFajrTimesFor2Months(user.position);

    final fajrTimeWithVariant = fajrTimes
        .map((time) => time.applyVariant(request.minutesVariant))
        .where((time) => time.isOutdated == false)
        .toList();

    await notificationsService.scheduleFajrAlarms(fajrTimeWithVariant);

    final updatedUser = user.copyWith(
      upcomingAlarms: fajrTimeWithVariant,
      prefferedMinutesVariant: request.minutesVariant,
    );
    print(updatedUser);
    await userRepository.update(updatedUser, updatedUser.id);

    return SetFajrAlarmResponse(updatedUser: updatedUser);
  }
}

class SetFajrAlarmRequest {
  final int minutesVariant;
  final User user;
  SetFajrAlarmRequest({
    required this.minutesVariant,
    required this.user,
  });
}

class SetFajrAlarmResponse {
  final User updatedUser;
  SetFajrAlarmResponse({
    required this.updatedUser,
  });
}

final setFajrAlarmPvdr = Provider(
  (ref) => SetFajrAlarm(
    prayerTimeRepository: ref.read(prayerRepoPvdr),
    notificationsService: ref.read(notificationsSrvcPvdr),
    userRepository: ref.read(userRepoPvdr),
  ),
);
