import 'package:deek/lib.dart';

class SetUserCurrentLocation extends UseCase<User, User> {
  final LocationRepository locationRepository;
  final UserRepository userRepository;
  SetUserCurrentLocation({
    required this.locationRepository,
    required this.userRepository,
  });

  @override
  Future<User> call(User user) async {
    final position = await locationRepository.getCurrentPosition();
    final updatedUser = user.copyWith(position: position);
    userRepository.update(updatedUser, user.id);
    return updatedUser;
  }
}

final setUserLocationPvdr = Provider((ref) => SetUserCurrentLocation(
    locationRepository: ref.read(locationRepoPvdr),
    userRepository: ref.read(userRepoPvdr)));
