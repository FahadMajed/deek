import 'package:deek/lib.dart';

class TurnOffAlarms extends NoRequestUseCase<User> {
  final UserRepository userRepository;
  final NotificationsService notificationsService;

  TurnOffAlarms({
    required this.userRepository,
    required this.notificationsService,
  });

  @override
  Future<User> call() async {
    final user = await userRepository.getById("1");
    final updatedUser = user.turnOffAlarms();
    userRepository.update(updatedUser, updatedUser.id);
    notificationsService.turnOffAlarms();
    return updatedUser;
  }
}

final turnOffAlarmsPvdr = Provider<TurnOffAlarms>((ref) => TurnOffAlarms(
      userRepository: ref.read(userRepoPvdr),
      notificationsService: ref.read(notificationsSrvcPvdr),
    ));
