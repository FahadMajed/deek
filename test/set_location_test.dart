import 'package:deek/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mocks.dart';

void main() {
  setUp(() async => WidgetsFlutterBinding.ensureInitialized());

  test('should ask for permission and returns user updated city', () async {
    final user = User(address: Address.fromMap({}), id: "1");

    final updatedUser = await SetUserCurrentLocation(
      locationRepository: locationRepoMock,
      userRepository: userRepoFake,
    ).call(user);

    final repoUser = userRepoFake.user;
    assert(repoUser == updatedUser);

    expect(updatedUser.address.city.toLowerCase(), "riyadh");
  });
}
