import 'package:deek/core/domain/models/address.dart';

abstract class LocationRepository {
  Future<Address> getCurrentAddress();
}
