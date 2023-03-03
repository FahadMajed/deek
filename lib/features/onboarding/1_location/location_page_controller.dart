import 'package:deek/lib.dart';

class LocationViewController extends OnboardingViewController {
  late final SetUserCurrentLocation setUserCurrentLocation;
  LocationViewController(super.read) {
    setUserCurrentLocation = read(setUserLocationPvdr);
  }

  @override
  Future<void> onActionButtonPressed() async {
    showNextPage();

    await setUserCurrentLocation
        .call()
        .then((updatedUser) => emitData(updatedUser));
  }
}

final locationViewCtrlPvdr =
    Provider((ref) => LocationViewController(ref.read));
