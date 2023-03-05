import 'package:deek/lib.dart';
import 'package:mockito/mockito.dart';

class PrayerTimeRepoMock extends Mock implements PrayerTimeRepository {
  @override
  Future<List<DateTime>> getFajrTimesFor2Months(LongLat address) async => [
        DateTime(2024, 1, 1, 5, 10),
        DateTime(2024, 1, 1, 5, 11),
        DateTime(2024, 1, 1, 5, 12),
        DateTime(2024, 1, 1, 5, 13),
        DateTime(2024, 1, 1, 5, 14),
        DateTime(2024, 1, 1, 5, 15),
      ];
}
