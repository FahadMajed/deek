import 'package:deek/core/domain/models/user.dart';
import 'package:reach_core/core/core.dart' hide User;

class UserRepository implements Repository<User, void> {
  @override
  RemoteDatabase<User, void> get remoteDatabase => throw UnimplementedError();

  @override
  Future<void> create(User object, String id) {
    throw UnimplementedError();
  }

  @override
  Future<User> getById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(User object, String id) => throw UnimplementedError();

  @override
  Future<void> delete(String id) => throw UnimplementedError();

  @override
  Future<List<User>> getAll({int? limit}) => throw UnimplementedError();
}
