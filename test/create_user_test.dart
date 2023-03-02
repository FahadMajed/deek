import 'package:deek/core/domain/use_cases/create_user.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/user_repo_mock.dart';

void main() {
  test('should returns new user', () async {
    final user = await CreateUser(userRepoFake)();
    expect(user.id.isNotEmpty, true);
  });
}
