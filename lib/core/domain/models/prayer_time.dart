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
  String toString() =>
      'PrayerTime(id: $id , h: ${dateTime.hour},m: ${dateTime.minute})';

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime.millisecondsSinceEpoch,
      'id': id,
    };
  }

  factory PrayerTime.fromMap(map) {
    return PrayerTime(
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] ?? 0),
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PrayerTime.fromJson(String source) =>
      PrayerTime.fromMap(json.decode(source));

  PrayerTime removeVariant(int minutesVariant) {
    return PrayerTime(
        id: id,
        dateTime: dateTime.add(
          Duration(minutes: -1 * minutesVariant),
        ));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PrayerTime && other.dateTime == dateTime && other.id == id;
  }

  @override
  int get hashCode => dateTime.hashCode ^ id.hashCode;
}
