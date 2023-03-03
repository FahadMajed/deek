import 'dart:convert';

import 'package:deek/lib.dart';

class User {
  final LongLat position;
  final String id;
  final List<PrayerTime> upcomingAlarms;

  final int prefferedMinutesVariant;

  User({
    required this.position,
    required this.id,
    this.upcomingAlarms = const [],
    this.prefferedMinutesVariant = 0,
  });

  User copyWith(
      {LongLat? position,
      List<PrayerTime>? upcomingAlarms,
      int? prefferedMinutesVariant}) {
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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      position: LongLat.fromMap(map['longLat'] ?? {"long": 21, "lat": 21}),
      id: map['id'] ?? '',
      prefferedMinutesVariant: map['prefferedMinutesVariant'] ?? 0,
      upcomingAlarms: List<PrayerTime>.from(
          map['upcomingAlarms']?.map((x) => PrayerTime.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User removeOutdatedAlarms() {
    final upcomingAlarms = <PrayerTime>[];
    for (final alarm in this.upcomingAlarms) {
      if (alarm.isOutdated == false) {
        upcomingAlarms.add(alarm);
      }
    }

    return copyWith(upcomingAlarms: upcomingAlarms);
  }

  bool reachedAlarmLimit() => upcomingAlarms.length <= 3;

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
}
