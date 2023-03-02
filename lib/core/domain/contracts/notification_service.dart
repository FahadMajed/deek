import 'package:deek/lib.dart';

abstract class NotificationsService {
  Future<void> scheduleFajrAlarms(List<PrayerTime> fajrTimes);

  Future<void> requestPermission();
}
