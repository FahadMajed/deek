import 'dart:convert';

class Alarm {
  DateTime dateTime;
  final int id;
  Alarm({
    required this.dateTime,
    required this.id,
  });

  bool get isOutdated => dateTime.isBefore(DateTime.now());

  ///[minutesVariant] is what the user want the alarm to vary upon, e.g. if it is
  ///five the alarm will ring after the athan by 5 seconds
  Alarm applyVariant(int minutesVariant) {
    return Alarm(
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

  factory Alarm.fromMap(map) {
    return Alarm(
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] ?? 0),
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Alarm.fromJson(String source) => Alarm.fromMap(json.decode(source));

  Alarm removeVariant(int minutesVariant) {
    return Alarm(
        id: id,
        dateTime: dateTime.add(
          Duration(minutes: -1 * minutesVariant),
        ));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Alarm && other.dateTime == dateTime && other.id == id;
  }

  @override
  int get hashCode => dateTime.hashCode ^ id.hashCode;
}
