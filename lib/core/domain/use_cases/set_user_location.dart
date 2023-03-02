import 'package:deek/core/core.dart';
import 'package:reach_core/core/utilities/utilities.dart';

class SetUserCurrentLocation extends UseCase<User, User> {
  final LocationRepository locationRepository;
  final UserRepository userRepository;
  SetUserCurrentLocation({
    required this.locationRepository,
    required this.userRepository,
  });

  @override
  Future<User> call(User user) async {
    final address = await locationRepository.getCurrentAddress();
    final updatedUser = user.copyWith(address: address);
    userRepository.update(updatedUser, user.id);
    return updatedUser;
  }
}
