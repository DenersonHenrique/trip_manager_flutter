import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/commons/commons.dart';
import 'app/modules/auth/auth_module.dart';
import 'app/modules/home/home_module.dart';
import 'app/modules/splash/presentation/splash_page.dart';
import 'app/modules/splash/presentation/splash_viewmodel.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<IHttpClient>(HttpClient.new);
    i.addSingleton<IStorageClient>(StorageAdapter.new);
    i.addSingleton<SplashViewModel>(SplashViewModel.new);
    i.addSingleton<IDatabaseStorage>(DatabaseStorageAdapter.new);
    i.addLazySingleton<SharedPreferences>(SharedPreferences.getInstance);
  }

  @override
  List<Module> get imports => [
        HomeModule(),
        AuthModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SplashPage(),
      transition: TransitionType.fadeIn,
    );
    r.module(
      '/auth',
      module: AuthModule(),
      transition: TransitionType.fadeIn,
    );
    r.module(
      '/home',
      module: HomeModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
