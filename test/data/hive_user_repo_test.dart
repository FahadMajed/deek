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
  final hiveUserRepo = DefaultUserRepository();
  test('should save user in box', () async {
    await CreateUser(hiveUserRepo).call();
    final user = await hiveUserRepo.getById("1");
    expect(user.id, "1");
  });

  test('should update user in box', () async {
    final user = await hiveUserRepo.getById("1");

    assert(user.position.long != 20);
    await hiveUserRepo.update(User(position: LongLat(20, 20), id: "1"), "1");
    final updatedUser = await hiveUserRepo.getById("1");
    expect(updatedUser.position.long, 20);
  });

  test('should get updated user in box', () async {
    final updatedUser = await hiveUserRepo.getById("1");
    expect(updatedUser.position.long, 20);
  });
}
