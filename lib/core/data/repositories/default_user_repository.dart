//HIVE USER REPO

import 'package:deek/lib.dart';

import 'package:hive_flutter/hive_flutter.dart';

class DefaultUserRepository implements UserRepository {
  Box get _userBox => Hive.box("user");

  @override
  Future<void> create(User object, String id) async {
    await delete("1");
    await _userBox.put(id, object.toMap());
  }

  @override
  Future<void> delete(String id) async {
    await _userBox.delete(id);
  }

  @override
  Future<List<User>> getAll({int? limit}) {
    throw UnimplementedError();
  }

  @override
  Future<User> getById(String id) async {
    final user = User.fromMap(_userBox.values.first);
    print(user);
    return user;
  }

  @override
  RemoteDatabase<User, void> get remoteDatabase => throw UnimplementedError();

  @override
  Future<void> update(User object, String id) async {
    await _userBox.put(id, object.toMap());
  }

  @override
  Map<String, User> get collection => throw UnimplementedError();

  @override
  // TODO: implement subCollection
  Map<String, void> get subCollection => throw UnimplementedError();
}

final userRepoPvdr = Provider((ref) => DefaultUserRepository());
