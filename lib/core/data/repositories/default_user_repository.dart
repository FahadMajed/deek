//HIVE USER REPO

import 'package:deek/lib.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:reach_core/core/utilities/base_classes/remote_database.dart';

class DefaultUserRepositiry implements UserRepository {
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
}
