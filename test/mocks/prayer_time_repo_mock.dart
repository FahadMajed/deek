import 'package:deek/lib.dart';
import 'package:mockito/mockito.dart';

class PrayerTimeRepoMock extends Mock implements PrayerTimeRepository {
  @override
  Future<List<PrayerTime>> getFajrTimesFor2Months(LongLat address) async => [
        PrayerTime(
          id: 1,
          dateTime: DateTime(2024, 1, 1, 5, 10),
        ),
        PrayerTime(
          id: 2,
          dateTime: DateTime(2024, 1, 1, 5, 11),
        ),
        PrayerTime(
          id: 3,
          dateTime: DateTime(2024, 1, 1, 5, 12),
        ),
        PrayerTime(
          id: 4,
          dateTime: DateTime(2024, 1, 1, 5, 13),
        ),
        PrayerTime(
          id: 5,
          dateTime: DateTime(2024, 1, 1, 5, 14),
        ),
        PrayerTime(
          id: 6,
          dateTime: DateTime(2024, 1, 1, 5, 15),
        ),
      ];
}
