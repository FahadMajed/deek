import 'package:deek/lib.dart';

class SetUserCurrentLocation extends NoRequestUseCase<User> {
  final LocationRepository locationRepository;
  final UserRepository userRepository;
  SetUserCurrentLocation({
    required this.locationRepository,
    required this.userRepository,
  });

  @override
  Future<User> call() async {
    final user = await userRepository.getById("1");

    final position = await locationRepository.getCurrentPosition();

    final updatedUser = user.setLocation(position);

    await userRepository.update(updatedUser, user.id);
    return updatedUser;
  }
}

final setUserLocationPvdr = Provider((ref) => SetUserCurrentLocation(
    locationRepository: ref.read(locationRepoPvdr),
    userRepository: ref.read(userRepoPvdr)));
