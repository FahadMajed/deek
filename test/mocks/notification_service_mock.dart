import 'package:deek/lib.dart';
import 'package:mockito/mockito.dart';

final notificationServiceMock = NotificationServiceMock();

class NotificationServiceMock extends Mock implements NotificationsService {
  @override
  Future<void> scheduleFajrAlarms(List<Alarm> fajrTimes) async {}
}
