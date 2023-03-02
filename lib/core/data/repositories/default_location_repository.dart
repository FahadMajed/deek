import 'package:deek/lib.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class DefaultLocationRepository implements LocationRepository {
  final Geolocator geolocator;

  DefaultLocationRepository({
    required this.geolocator,
  });

  //API
  @override
  Future<Address> getCurrentAddress() async {
    await _getPermission();

    final longLat = await _getCurrentDevicePosition();
    final city = _getAddressByLongLat(longLat);

    return city;
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

  Future<Address> _getAddressByLongLat(LongLat longLat) async {
    final placeMarks =
        await placemarkFromCoordinates(longLat.long, longLat.lat);
    final placeMark = placeMarks.first;
    final city = placeMark.locality;
    if (city == null) {
      Exception("CITY NOT FOUND");
    }
    return Address.fromJson(placeMark.toJson().toString());
  }
}
