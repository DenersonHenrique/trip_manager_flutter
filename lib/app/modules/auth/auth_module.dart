import 'package:flutter_modular/flutter_modular.dart';

import '../../commons/adapters/http/http_client.dart';
import '../../commons/adapters/storage/storage_client.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repository.dart';
import 'domain/repositories/auth_respository.dart';
import 'domain/usecases/login_with_credentials_usecase.dart';
import 'domain/usecases/user_register_usecase.dart';
import 'presentation/auth_page.dart';
import 'presentation/auth_viewmodel.dart';
import 'services/auth_service.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<IAuthLocalDatasource>(
      () => AuthLocalDatasource(
        i.get<IStorageClient>(),
      ),
    );
    i.addLazySingleton<IAuthRemoteDatasource>(
      () => AuthRemoteDatasource(
        i.get<IHttpClient>(),
        i.get<IStorageClient>(),
      ),
    );
    i.addLazySingleton<IAuthRepository>(AuthRepository.new);
    i.addSingleton<IUserRegisterUsecase>(UserRegisterUsecase.new);
    i.addSingleton<ILoginWithCredentialsUsecase>(
      LoginWithCredentialsUsecase.new,
    );
    i.addSingleton<AuthViewModel>(AuthViewModel.new);
    i.addSingleton<IAuthService>(AuthService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const AuthPage(),
    );
  }
}
