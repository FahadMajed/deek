import 'package:deek/lib.dart';

abstract class NotificationsService {
  Future<void> scheduleFajrAlarms(List<Alarm> fajrTimes);

  Future<void> requestPermission();

  Future<void> turnOffAlarms();
}
