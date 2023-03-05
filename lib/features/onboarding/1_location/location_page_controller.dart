import 'package:deek/lib.dart';

class LocationViewController extends OnboardingViewController {
  late final SetUserCurrentLocation setUserCurrentLocation;
  LocationViewController(super.read) {
    setUserCurrentLocation = read(setUserLocationPvdr);
  }

  @override
  Future<void> onActionButtonPressed() async {
    await setUserCurrentLocation.call().then((updatedUser) {
      showNextPage();
      emitData(updatedUser);
    });
  }
}

final locationViewCtrlPvdr =
    Provider((ref) => LocationViewController(ref.read));
