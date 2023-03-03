import 'package:deek/core/domain/models/user.dart';
import 'package:deek/core/utilities/utilities.dart';

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

  @override
  // TODO: implement collection
  Map<String, User> get collection => throw UnimplementedError();

  @override
  // TODO: implement subCollection
  Map<String, void> get subCollection => throw UnimplementedError();
}
