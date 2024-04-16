import 'package:faker/faker.dart';
import 'package:trip_manager_flutter/app/modules/auth/domain/entities/registered_user_entity.dart';

class MockRegisteredUserEntity extends RegisteredUserEntity {
  const MockRegisteredUserEntity({
    required super.idToken,
    required super.email,
    required super.refreshToken,
    required super.expiresIn,
    required super.localId,
  });

  factory MockRegisteredUserEntity.random() {
    final faker = Faker();
    return MockRegisteredUserEntity(
      idToken: faker.guid.guid(),
      email: faker.internet.email(),
      refreshToken: faker.guid.guid(),
      expiresIn: faker.date.dateTime().toString(),
      localId: faker.guid.guid(),
    );
  }
}
