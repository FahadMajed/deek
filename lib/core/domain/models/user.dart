import 'package:flutter/foundation.dart';

import 'package:deek/lib.dart';

class User {
  final LongLat position;
  final String id;
  final List<Alarm> upcomingAlarms;

  final int prefferedMinutesVariant;

  User({
    required this.position,
    required this.id,
    this.upcomingAlarms = const [],
    this.prefferedMinutesVariant = 0,
  });

  bool get hasAlarms => upcomingAlarms.isNotEmpty;

  bool get isNotDefault => position.lat != 0 && position.lat != 21.0;

  bool get reachedAlarmLimit => upcomingAlarms.length <= 3;

  User setLocation(LongLat position) => _copyWith(position: position);

  User setMinutesVariant(int minutesVariant) =>
      _copyWith(prefferedMinutesVariant: minutesVariant);

  User removeOutdatedAlarms() => _copyWith(upcomingAlarms: [
        for (final alarm in upcomingAlarms)
          if (alarm.isOutdated == false) alarm
      ]);

  User turnOffAlarms() => _copyWith(upcomingAlarms: []);

  User setFajrAlarms(List<DateTime> fajrTimes, int minutesVariant) {
    int id = 1;
    final fajrTimesWithVariant = fajrTimes
        .map(
          (time) =>
              Alarm(dateTime: time, id: id++).applyVariant(minutesVariant),
        )
        .where((alarm) => alarm.isOutdated == false)
        .toList();

    return _copyWith(
      prefferedMinutesVariant: minutesVariant,
      upcomingAlarms: fajrTimesWithVariant,
    );
  }

  User updateAlarms(int minutesVariant) {
    final timesWithoutVariant = _getTimesWithoutVariant();
    return setFajrAlarms(timesWithoutVariant, minutesVariant);
  }

  List<DateTime> _getTimesWithoutVariant() => upcomingAlarms
      .map((time) => time.removeVariant(prefferedMinutesVariant).dateTime)
      .toList();

  @override
  String toString() {
    return 'User(address: $position, id: $id, upcomingAlarms: $upcomingAlarms, prefferedMinutesVariant: $prefferedMinutesVariant)';
  }

  factory User.empty() => User(
        id: "1",
        position: LongLat.fromMap({}),
        prefferedMinutesVariant: 0,
        upcomingAlarms: [],
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.position == position &&
        other.id == id &&
        listEquals(other.upcomingAlarms, upcomingAlarms) &&
        other.prefferedMinutesVariant == prefferedMinutesVariant;
  }

  @override
  int get hashCode {
    return position.hashCode ^
        id.hashCode ^
        upcomingAlarms.hashCode ^
        prefferedMinutesVariant.hashCode;
  }

  User _copyWith({
    LongLat? position,
    List<Alarm>? upcomingAlarms,
    int? prefferedMinutesVariant,
  }) {
    return User(
      position: position ?? this.position,
      upcomingAlarms: upcomingAlarms ?? this.upcomingAlarms,
      prefferedMinutesVariant:
          prefferedMinutesVariant ?? this.prefferedMinutesVariant,
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'position': position.toMap(),
      'id': id,
      'upcomingAlarms': upcomingAlarms.map((x) => x.toMap()).toList(),
      'prefferedMinutesVariant': prefferedMinutesVariant,
    };
  }

  factory User.fromMap(map) {
    if (map == null) {
      return User.empty();
    }
    return User(
      position: LongLat.fromMap(map['position']),
      id: map['id'] ?? '',
      prefferedMinutesVariant: map['prefferedMinutesVariant'] ?? 0,
      upcomingAlarms:
          List<Alarm>.from(map['upcomingAlarms']?.map((x) => Alarm.fromMap(x))),
    );
  }
}
