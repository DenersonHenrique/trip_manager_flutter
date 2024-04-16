import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_manager_flutter/app/modules/auth/auth.dart';

import '../../../../../mocks/login_params_entity_mock.dart';
import '../../../../../mocks/registered_user_entity_mock.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late UserRegisterUsecase userRegisterUsecase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    userRegisterUsecase = UserRegisterUsecase(mockRepository);
  });

  test('UserRegisterUsecase calls registerUser from repository', () async {
    final loginParams = MockLoginParamsEntity.random();
    final registeredUser = MockRegisteredUserEntity.random();

    when(() => mockRepository.registerUser(loginParams)).thenAnswer(
      (_) async => registeredUser,
    );

    final result = await userRegisterUsecase(loginParams);

    expect(result, equals(registeredUser));
    verify(() => mockRepository.registerUser(loginParams)).called(1);
  });
}
