import 'package:flutter/material.dart';

class HomeViewModel {
  final String label;
  final String alarmStatus;
  final String alarmTime;
  final IconData iconData;

  HomeViewModel({
    required this.label,
    required this.alarmStatus,
    required this.alarmTime,
    required this.iconData,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeViewModel &&
        other.alarmStatus == alarmStatus &&
        other.alarmTime == alarmTime;
  }

  @override
  int get hashCode => alarmStatus.hashCode ^ alarmTime.hashCode;

  @override
  String toString() => '(alarmStatus: $alarmStatus, alarmTime: $alarmTime)';
}
