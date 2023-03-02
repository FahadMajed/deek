import 'package:deek/core/core.dart';
import 'package:rest_api/rest_client.dart';

class HttpPrayerTimeRepository implements PrayerTimeRepository {
  final RESTClient client;

  HttpPrayerTimeRepository(this.client);

  @override
  Future<List<PrayerTime>> getFajrTimesFor2Months(Address address) async {
    final List<PrayerTime> fajrPrayerTimes = [];

    final currentDate = DateTime.now();
    final currentYear = currentDate.year;
    final currentMonth = currentDate.month;

    fajrPrayerTimes.addAll(
      await _getFajrTimesForMonth(
        year: currentYear,
        month: currentMonth,
        address: address,
        idStartsAt: 0,
      ),
    );

    final dateAfterMonth = currentDate.add(const Duration(days: 30));
    final yearAfterMonth = dateAfterMonth.year;
    final monthAfterMonth = dateAfterMonth.month;

    fajrPrayerTimes.addAll(
      await _getFajrTimesForMonth(
        year: yearAfterMonth,
        month: monthAfterMonth,
        address: address,
        idStartsAt: fajrPrayerTimes.length + 1,
      ),
    );

    return fajrPrayerTimes;
  }

  Future<List<PrayerTime>> _getFajrTimesForMonth({
    required int year,
    required int month,
    required Address address,
    required int idStartsAt,
  }) async {
    final List<PrayerTime> fajrPrayerTimesForMonth = [];

    final responseForMonth = await client.call(
      RESTOption.get,
      path:
          "calendarByCity/$year/$month?city=${address.city}&country=${address.country}&method=4",
    ); // returns prayer times for the month and year

    final List<DateTime> fajrTimes = _parseReponse(
      responseForMonth,
      year: year,
      month: month,
    );

    int id = idStartsAt;
    for (final fajrTime in fajrTimes) {
      fajrPrayerTimesForMonth.add(PrayerTime(
        dateTime: fajrTime,
        id: id++,
      ));
    }

    return fajrPrayerTimesForMonth;
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