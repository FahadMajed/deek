import 'dart:convert';

class Address {
  final String street;
  final String city;
  final String state;
  final String country;
  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  factory Address.fromString(String address) {
    final addressSplited = address.split(",");
    return Address(
      street: addressSplited[0],
      city: addressSplited[1],
      state: addressSplited[2],
      country: addressSplited[3],
    );
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(street: $street, city: $city, state: $state, country: $country)';
  }

  bool contains(String text) =>
      street.contains(text) ||
      city.contains(text) ||
      state.contains(text) ||
      country.contains(text);
}
