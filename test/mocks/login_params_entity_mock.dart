import 'package:faker/faker.dart';
import 'package:trip_manager_flutter/app/modules/auth/domain/entities/login_params_entity.dart';

class MockLoginParamsEntity extends LoginParamsEntity {
  const MockLoginParamsEntity({
    required super.email,
    required super.password,
  });

  factory MockLoginParamsEntity.random() {
    final faker = Faker();
    return MockLoginParamsEntity(
      email: faker.internet.email(),
      password: faker.internet.password(),
    );
  }
}
