import 'package:deek/lib.dart';

abstract class PrayerTimeRepository {
  Future<List<DateTime>> getFajrTimesFor2Months(LongLat position);
}
