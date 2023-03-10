import 'dart:convert';

class LongLat {
  final double long;
  final double lat;

  LongLat(this.long, this.lat);

  Map<String, dynamic> toMap() {
    return {
      'long': long,
      'lat': lat,
    };
  }

  factory LongLat.fromMap(map) {
    return LongLat(
      map['long']?.toDouble() ?? 0.0,
      map['lat']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LongLat.fromJson(String source) =>
      LongLat.fromMap(json.decode(source));

  @override
  String toString() => 'LongLat(long: $long, lat: $lat)';
}
