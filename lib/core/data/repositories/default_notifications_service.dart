// ignore_for_file: depend_on_referenced_packages

import 'package:deek/lib.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsService implements NotificationsService {
  static final instance = LocalNotificationsService._internal();

  LocalNotificationsService._internal();

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Future<void> requestPermission({
    Function? onNotificationSelected,
    Function? onNotificationSelectedAndLaunchedTheApp,
  }) async {
    final initializationSettingsIOS = DarwinInitializationSettings(
      requestCriticalPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(iOS: initializationSettingsIOS);

    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: (response) async {
      final didNotificationLaunchApp =
          await _checkOfNotificationLaunchedTheApp();

      didNotificationLaunchApp
          ? onNotificationSelectedAndLaunchedTheApp?.call()
          : onNotificationSelected?.call();
    });
  }

  @override
  Future<void> scheduleFajrAlarms(List<PrayerTime> fajrTimes) async {
    notificationsPlugin.pendingNotificationRequests();
    tz.initializeTimeZones();
    for (final fajrTime in fajrTimes) {
      notificationsPlugin.zonedSchedule(
        fajrTime.id,
        "منبة الفجر",
        "الصلاة خير من النوم",
        tz.TZDateTime.from(fajrTime.dateTime, tz.local),
        _notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        androidAllowWhileIdle: false,
      );
    }
  }

  NotificationDetails _notificationDetails() {
    return const NotificationDetails(
      iOS: DarwinNotificationDetails(
        interruptionLevel: InterruptionLevel.timeSensitive,
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        sound: 'alarm_sound.mp3',
      ),
    );
  }

  Future<bool> _checkOfNotificationLaunchedTheApp() async {
    final notificationAppLaunchDetails =
        await notificationsPlugin.getNotificationAppLaunchDetails();

    return notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
  }
}

final notificationsSrvcPvdr = Provider<NotificationsService>(
  (ref) => LocalNotificationsService.instance,
);
