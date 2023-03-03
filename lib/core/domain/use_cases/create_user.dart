import 'package:deek/lib.dart';

class CreateUser extends NoRequestUseCase<User> {
  final UserRepository repository;
  CreateUser(this.repository);
  @override
  Future<User> call() async {
    final user = User.empty();
    repository.create(user, "1");
    return user;
  }
}

final createUserPvdr = Provider((ref) => CreateUser(ref.read(userRepoPvdr)));
