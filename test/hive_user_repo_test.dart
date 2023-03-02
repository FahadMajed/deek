import 'dart:io';

import 'package:deek/lib.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';

void main() {
  setUp(() async {
    var path = Directory.current.path;
    Hive.init(path);
    await Hive.openBox("user");
  });
  final hiveUserRepo = DefaultUserRepositiry();
  test('should save user in box', () async {
    await CreateUser(hiveUserRepo).call();
    final user = await hiveUserRepo.getById("1");
    expect(user.id, "1");
  });

  test('should update user in box', () async {
    final user = await hiveUserRepo.getById("1");
    assert(user.address.state != "SAUDI");
    await hiveUserRepo.update(
        User(
            address: Address(
              city: "SAUDI",
              country: '',
              state: '',
              street: '',
            ),
            id: "1"),
        "1");
    final updatedUser = await hiveUserRepo.getById("1");
    expect(updatedUser.address.city, "SAUDI");
  });
}
