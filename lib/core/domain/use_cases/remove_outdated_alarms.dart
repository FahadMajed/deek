import 'package:deek/lib.dart';

//Called every time app is opened
class RemoveOutdatedAlarms extends NoRequestUseCase<User> {
  final UserRepository userRepository;

  final SetFajrAlarm setFajrAlarm;
  RemoveOutdatedAlarms({
    required this.userRepository,
    required this.setFajrAlarm,
  });

  @override
  Future<User> call() async {
    final user = await userRepository.getById("1");

    final updatedUser = user.removeOutdatedAlarms();
    await userRepository.update(updatedUser, updatedUser.id);

    if (updatedUser.reachedAlarmLimit) {
      final updatedUser = await setFajrAlarm.call(SetFajrAlarmRequest(
        minutesVariant: user.prefferedMinutesVariant,
      ));
      return updatedUser;
    }
    return updatedUser;
  }
}

final markAlarmSeenPvdr = Provider((ref) => RemoveOutdatedAlarms(
      userRepository: ref.read(userRepoPvdr),
      setFajrAlarm: ref.read(setFajrAlarmPvdr),
    ));
