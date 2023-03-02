import 'package:deek/core/domain/contracts/user_repository.dart';
import 'package:deek/core/domain/models/address.dart';
import 'package:deek/core/domain/models/user.dart';
import 'package:reach_core/core/utilities/utilities.dart';

class CreateUser extends NoRequestUseCase<User> {
  final UserRepository repository;
  CreateUser(this.repository);
  @override
  Future<User> call() async {
    final user = User(address: Address.fromMap({}), id: "1");
    repository.create(user, "1");
    return user;
  }
}
