import 'package:flutter_modular/flutter_modular.dart';

import '../../commons/commons.dart';
import '../auth/auth.dart';
import 'data/datasources/transactions_local_datasource.dart';
import 'data/repositories/transactions_repository.dart';
import 'domain/domain.dart';
import 'presentantion/home_page.dart';
import 'presentantion/home_viewmodel.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<IAuthService>(AuthService.new);
    i.addSingleton<HomeViewModel>(HomeViewModel.new);
    i.addLazySingleton<IAuthRepository>(AuthRepository.new);
    i.addSingleton<IGetTransactionsUsecase>(GetTransactionsUsecase.new);
    i.addSingleton<IAddTransactionsUsecase>(AddTransactionsUsecase.new);
    i.addLazySingleton<ITransactionsRepository>(TransactionsRepository.new);
    i.addSingleton<IUpdateTransactionsUsecase>(UpdateTransactionsUsecase.new);
    i.addSingleton<IDeleteTransactionsUsecase>(DeleteTransactionsUsecase.new);
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

    i.addLazySingleton<ITransactionsLocalDatasource>(
      () => TransactionsLocalDatasource(
        i.get<IDatabaseStorage>(),
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
