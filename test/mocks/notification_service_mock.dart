import 'package:deek/core/core.dart';
import 'package:mockito/mockito.dart';

final notificationServiceMock = NotificationServiceMock();

class NotificationServiceMock extends Mock implements NotificationsService {
  @override
  Future<void> scheduleFajrAlarms(List<PrayerTime> fajrTimes) async {}
}
