import 'package:deek/lib.dart';

// could be optimised by caching the prayer times
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
    final user = await userRepository.getById("1");

    final fajrTimes =
        await prayerTimeRepository.getFajrTimesFor2Months(user.position);

    final updatedUser = user.setFajrAlarms(fajrTimes, request.minutesVariant);

    notificationsService.scheduleFajrAlarms(updatedUser.upcomingAlarms);

    userRepository.update(updatedUser, updatedUser.id);

    return updatedUser;
  }
}

class SetFajrAlarmRequest {
  final int minutesVariant;

  SetFajrAlarmRequest({
    required this.minutesVariant,
  });
}

final setFajrAlarmPvdr = Provider(
  (ref) => SetFajrAlarm(
    prayerTimeRepository: ref.read(prayerRepoPvdr),
    notificationsService: ref.read(notificationsSrvcPvdr),
    userRepository: ref.read(userRepoPvdr),
  ),
);
