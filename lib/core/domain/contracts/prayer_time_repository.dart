import 'package:deek/lib.dart';
import 'package:rest_api/rest_client.dart';

abstract class PrayerTimeRepository {
  Future<List<PrayerTime>> getFajrTimesFor2Months(Address address);
}
