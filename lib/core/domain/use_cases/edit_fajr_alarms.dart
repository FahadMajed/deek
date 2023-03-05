import 'package:deek/lib.dart';

class EditFajrAlarm extends UseCase<User, EditFajrAlarmRequest> {
  final NotificationsService notificationsService;
  final UserRepository userRepository;
  EditFajrAlarm({
    required this.notificationsService,
    required this.userRepository,
  });

  @override
  Future<User> call(EditFajrAlarmRequest request) async {
    final user = request.user;

    final updatedUser = user.updateAlarms(request.minutesVariant);

    notificationsService.scheduleFajrAlarms(updatedUser.upcomingAlarms);

    userRepository.update(updatedUser, updatedUser.id);

    return updatedUser;
  }
}

class EditFajrAlarmRequest {
  final int minutesVariant;
  final User user;
  EditFajrAlarmRequest({
    required this.minutesVariant,
    required this.user,
  });
}

final editFajrAlarmPvdr = Provider<EditFajrAlarm>((ref) => EditFajrAlarm(
    userRepository: ref.read(userRepoPvdr),
    notificationsService: ref.read(notificationsSrvcPvdr)));
