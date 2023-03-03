import 'package:deek/lib.dart';

abstract class PrayerTimeRepository {
  Future<List<PrayerTime>> getFajrTimesFor2Months(LongLat position);
}
