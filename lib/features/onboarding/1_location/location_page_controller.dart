import 'package:deek/lib.dart';

class LocationViewController extends AsyncViewController<User>
    with PageViewController {
  late final SetUserCurrentLocation setUserCurrentLocation;
  LocationViewController(super.read) : super(viewModelPvdr: userPvdr) {
    setUserCurrentLocation = read(setUserLocationPvdr);
  }

  Future<void> onRequestPermission() async {
    final updatedUser = await setUserCurrentLocation.call(viewModelAsData);

    emitData(updatedUser);
    incrementPage();
  }
}

final locationViewCtrlPvdr =
    Provider((ref) => LocationViewController(ref.read));
