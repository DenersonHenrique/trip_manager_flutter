import 'package:flutter_modular/flutter_modular.dart';

import '../../commons/adapters/http/http_client.dart';
import '../../commons/adapters/storage/storage_client.dart';
import '../auth/data/datasources/auth_local_datasource.dart';
import '../auth/data/datasources/auth_remote_datasource.dart';
import '../auth/data/repositories/auth_repository.dart';
import '../auth/domain/repositories/auth_respository.dart';
import '../auth/services/auth.dart';
import 'presentantion/home_page.dart';
import 'presentantion/home_viewmodel.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<IAuthRepository>(AuthRepository.new);
    i.addLazySingleton<IAuthService>(AuthService.new);
    i.addSingleton<HomeViewModel>(HomeViewModel.new);
    i.addLazySingleton<IAuthRemoteDatasource>(
      () => AuthRemoteDatasource(
        i.get<IHttpClient>(),
        i.get<IStorageClient>(),
      ),
    );
    i.addLazySingleton<IAuthLocalDatasource>(
      () => AuthLocalDatasource(
        i.get<IStorageClient>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
    );
  }
}
