import 'dart:convert';

class PrayerTime {
  DateTime dateTime;
  final int id;
  PrayerTime({
    required this.dateTime,
    required this.id,
  });

  bool get isOutdated => dateTime.isBefore(DateTime.now());

  ///[minutesVariant] is what the user want the alarm to vary upon, e.g. if it is
  ///five the alarm will ring after the athan by 5 seconds
  PrayerTime applyVariant(int minutesVariant) {
    return PrayerTime(
        id: id,
        dateTime: dateTime.add(
          Duration(minutes: minutesVariant),
        ));
  }

  @override
  String toString() => 'PrayerTime(id: $id)';

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime.millisecondsSinceEpoch,
      'id': id,
    };
  }

  factory PrayerTime.fromMap(Map<String, dynamic> map) {
    return PrayerTime(
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] ?? 0),
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PrayerTime.fromJson(String source) =>
      PrayerTime.fromMap(json.decode(source));
}
