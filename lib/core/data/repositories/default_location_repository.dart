import 'package:deek/lib.dart';
import 'package:geolocator/geolocator.dart';

class DefaultLocationRepository implements LocationRepository {
  //API
  @override
  Future<LongLat> getCurrentPosition() async {
    await _getPermission();

    final longLat = await _getCurrentDevicePosition();

    return longLat;
  }

  Future _getPermission() async {
    LocationPermission locationPermission;

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }
  }

  Future<LongLat> _getCurrentDevicePosition() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.lowest,
    );
    return LongLat(
      position.longitude,
      position.latitude,
    );
  }
}

final locationRepoPvdr =
    Provider<LocationRepository>((ref) => DefaultLocationRepository());
