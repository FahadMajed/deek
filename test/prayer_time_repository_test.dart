import 'package:deek/core/data/repositories/http_prayer_time_repository.dart';
import 'package:deek/lib.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rest_api/http_rest_client.dart';

void main() {
  final repository = HttpPrayerTimeRepository(
    HttpRESTClient(
      baseUrl: "http://api.aladhan.com/v1/",
      headers: {},
    ),
  );
  test("shouldv return list of fajr prayer time with ids", () async {
    final fajrPrayerTimes = await repository.getFajrTimesFor2Months(
      Address(
        street: "",
        city: "Riyadh",
        state: "",
        country: "Saudi Arabia",
      ),
    );
    final currentDate = DateTime.now();
    final currentMonth = currentDate.month;
    final nextMonth = currentDate.add(const Duration(days: 30)).month;

    expect(fajrPrayerTimes.any((time) => time.dateTime.month == currentMonth),
        true);
    expect(
        fajrPrayerTimes.any((time) => time.dateTime.month == nextMonth), true);
  });
}