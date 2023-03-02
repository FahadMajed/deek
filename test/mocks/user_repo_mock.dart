import 'package:deek/core/domain/contracts/user_repository.dart';
import 'package:reach_core/core/utilities/base_classes/remote_database.dart';
import 'package:deek/core/domain/models/user.dart';

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
}
