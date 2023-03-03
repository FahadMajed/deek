import 'package:deek/core/domain/models/address.dart';
import 'package:deek/lib.dart';

abstract class LocationRepository {
  Future<LongLat> getCurrentPosition();
}
