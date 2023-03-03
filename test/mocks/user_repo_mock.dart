import 'package:deek/core/core.dart';

final userRepoFake = UserRepoMock();

class UserRepoMock implements UserRepository {
  User? user;
  @override
  Future<void> create(User object, String id) async {
    user = object;
  }

  @override
  Future<void> delete(String id) async {
    user = null;
  }

  @override
  Future<List<User>> getAll({int? limit}) {
    throw UnimplementedError();
  }

  @override
  Future<User> getById(String id) async {
    return user!;
  }

  @override
  RemoteDatabase<User, void> get remoteDatabase => throw UnimplementedError();

  @override
  Future<void> update(User object, String id) async {
    user = object;
  }

  @override
  // TODO: implement collection
  Map<String, User> get collection => throw UnimplementedError();

  @override
  // TODO: implement subCollection
  Map<String, void> get subCollection => throw UnimplementedError();
}
