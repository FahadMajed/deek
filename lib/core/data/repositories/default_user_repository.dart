//HIVE USER REPO

import 'package:deek/lib.dart';

import 'package:hive_flutter/hive_flutter.dart';

class DefaultUserRepository implements UserRepository {
  Box get _userBox => Hive.box("user");

  @override
  Future<void> create(User object, String id) async {
    _userBox.put(id, object.toMap());
  }

  @override
  Future<void> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getAll({int? limit}) {
    throw UnimplementedError();
  }

  @override
  Future<User> getById(String id) async {
    return User.fromMap(_userBox.values.first);
  }

  @override
  RemoteDatabase<User, void> get remoteDatabase => throw UnimplementedError();

  @override
  Future<void> update(User object, String id) async {
    _userBox.put(id, object.toMap());
  }

  @override
  // TODO: implement collection
  Map<String, User> get collection => throw UnimplementedError();

  @override
  // TODO: implement subCollection
  Map<String, void> get subCollection => throw UnimplementedError();
}

final userRepoPvdr = Provider((ref) => DefaultUserRepository());
