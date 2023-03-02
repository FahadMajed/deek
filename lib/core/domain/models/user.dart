import 'dart:convert';

import 'package:deek/lib.dart';

class User {
  final Address address;
  final String id;
  final List<PrayerTime> upcomingAlarms;

  final int prefferedMinutesVariant;

  User({
    required this.address,
    required this.id,
    this.upcomingAlarms = const [],
    this.prefferedMinutesVariant = 0,
  });

  User copyWith(
      {Address? address,
      List<PrayerTime>? upcomingAlarms,
      int? prefferedMinutesVariant}) {
    return User(
      address: address ?? this.address,
      upcomingAlarms: upcomingAlarms ?? this.upcomingAlarms,
      prefferedMinutesVariant:
          prefferedMinutesVariant ?? this.prefferedMinutesVariant,
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address.toMap(),
      'id': id,
      'upcomingAlarms': upcomingAlarms.map((x) => x.toMap()).toList(),
      'prefferedMinutesVariant': prefferedMinutesVariant,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      address: Address.fromMap(map['address']),
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
    return 'User(address: $address, id: $id, upcomingAlarms: $upcomingAlarms, prefferedMinutesVariant: $prefferedMinutesVariant)';
  }
}
