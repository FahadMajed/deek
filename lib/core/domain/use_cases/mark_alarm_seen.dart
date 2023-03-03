import 'package:deek/lib.dart';

//Called every time app is opened
class MarkAlarmSeen extends NoRequestUseCase<User> {
  final UserRepository userRepository;

  final SetFajrAlarm setFajrAlarm;
  MarkAlarmSeen({
    required this.userRepository,
    required this.setFajrAlarm,
  });

  @override
  Future<User> call() async {
    final user = await userRepository.getById("1");

    final updatedUser = user.removeOutdatedAlarms();
    await userRepository.update(updatedUser, updatedUser.id);

    if (updatedUser.reachedAlarmLimit()) {
      final response = await setFajrAlarm.call(SetFajrAlarmRequest(
        minutesVariant: user.prefferedMinutesVariant,
      ));
      return response.updatedUser;
    }
    return updatedUser;
  }
}

final markAlarmSeenPvdr = Provider((ref) => MarkAlarmSeen(
      userRepository: ref.read(userRepoPvdr),
      setFajrAlarm: ref.read(setFajrAlarmPvdr),
    ));
