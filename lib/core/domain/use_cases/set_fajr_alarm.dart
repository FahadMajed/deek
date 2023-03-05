import 'package:deek/lib.dart';

class SetFajrAlarm extends UseCase<User, SetFajrAlarmRequest> {
  final PrayerTimeRepository prayerTimeRepository;
  final NotificationsService notificationsService;
  final UserRepository userRepository;

  SetFajrAlarm({
    required this.prayerTimeRepository,
    required this.notificationsService,
    required this.userRepository,
  });

  @override
  Future<User> call(SetFajrAlarmRequest request) async {
    final user = request.user;

    final fajrTimes =
        await prayerTimeRepository.getFajrTimesFor2Months(user.position);

    final updatedUser = user.setFajrAlarms(fajrTimes, request.minutesVariant);

    await notificationsService.scheduleFajrAlarms(updatedUser.upcomingAlarms);

    await userRepository.update(updatedUser, updatedUser.id);

    return updatedUser;
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

final setFajrAlarmPvdr = Provider(
  (ref) => SetFajrAlarm(
    prayerTimeRepository: ref.read(prayerRepoPvdr),
    notificationsService: ref.read(notificationsSrvcPvdr),
    userRepository: ref.read(userRepoPvdr),
  ),
);
