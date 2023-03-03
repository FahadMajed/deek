import 'package:deek/lib.dart';
import 'package:mockito/mockito.dart';

final locationRepoMock = LocationRepoMock();

class LocationRepoMock extends Mock implements LocationRepository {
  @override
  Future<LongLat> getCurrentPosition() async => LongLat(
        -0.1254872,
        51.508515,
      );
}
