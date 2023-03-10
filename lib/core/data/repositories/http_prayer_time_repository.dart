import 'package:deek/lib.dart';

import 'package:rest_api/http_rest_client.dart';
import 'package:rest_api/rest_client.dart';

class HttpPrayerTimeRepository implements PrayerTimeRepository {
  final RESTClient client;

  HttpPrayerTimeRepository(this.client);

  @override
  Future<List<DateTime>> getFajrTimesFor2Months(LongLat position) async {
    final List<DateTime> fajrPrayerTimes = [];

    final currentDate = DateTime.now();
    final currentYear = currentDate.year;
    final currentMonth = currentDate.month;

    fajrPrayerTimes.addAll(
      await _getFajrTimesForMonth(
        year: currentYear,
        month: currentMonth,
        position: position,
      ),
    );

    final dateAfterMonth = currentDate.add(const Duration(days: 30));
    final yearAfterMonth = dateAfterMonth.year;
    final monthAfterMonth = dateAfterMonth.month;

    fajrPrayerTimes.addAll(
      await _getFajrTimesForMonth(
        year: yearAfterMonth,
        month: monthAfterMonth,
        position: position,
      ),
    );

    return fajrPrayerTimes;
  }

  Future<List<DateTime>> _getFajrTimesForMonth({
    required int year,
    required int month,
    required LongLat position,
  }) async {
    final responseForMonth = await client.call(
      RESTOption.get,
      path:
          "calendar/$year/$month?latitude=${position.lat}&longitude=${position.long}&method=4",
    ); // returns prayer times for the month and year

    final List<DateTime> fajrTimes = _parseReponse(
      responseForMonth,
      year: year,
      month: month,
    );

    return fajrTimes;
  }

  List<DateTime> _parseReponse(
    Map response, {
    required int month,
    required int year,
  }) {
    final List data = response["data"];
    final List<DateTime> fajrTimes = [];
    for (final entry in data) {
      final timing = entry["timings"];
      final fajrTime = timing["Fajr"].toString(); //03:45
      final date = entry["date"]["gregorian"];

      final day = int.parse(date["day"]);
      final hour = int.parse(fajrTime.split(":")[0]);
      final min = int.parse(fajrTime.split(":")[1].substring(0, 2));

      fajrTimes.add(DateTime(
        year,
        month,
        day,
        hour,
        min,
      ));
    }
    return fajrTimes;
  }
}

final prayerRepoPvdr = Provider<PrayerTimeRepository>(
  (ref) => HttpPrayerTimeRepository(
    HttpRESTClient(
      baseUrl: "http://api.aladhan.com/v1/",
      headers: {},
    ),
  ),
);
