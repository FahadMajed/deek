import 'package:deek/core/core.dart';
import 'package:deek/core/domain/models/address.dart';
import 'package:mockito/mockito.dart';

final locationRepoMock = LocationRepoMock();

class LocationRepoMock extends Mock implements LocationRepository {
  @override
  Future<Address> getCurrentAddress() async => Address(
        city: 'riyadh',
        country: 'sa',
        state: 'riyadh',
        street: 'riyadh',
      );
}
