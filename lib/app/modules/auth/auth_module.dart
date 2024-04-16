import 'package:flutter_modular/flutter_modular.dart';

import '../../commons/commons.dart';
import 'auth.dart';
import 'presentation/auth_page.dart';
import 'presentation/auth_viewmodel.dart';

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
