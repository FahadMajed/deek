import 'package:deek/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mocks.dart';

void main() {
  setUp(() async => WidgetsFlutterBinding.ensureInitialized());

  test('should ask for permission and returns user updated city', () async {
    final updatedUser = await SetUserCurrentLocation(
      locationRepository: locationRepoMock,
      userRepository: userRepoFake,
    ).call(User.empty());

    final repoUser = userRepoFake.user;
    assert(repoUser == updatedUser);

    expect(
      updatedUser.position.long,
      -0.1254872,
    );
  });
}
