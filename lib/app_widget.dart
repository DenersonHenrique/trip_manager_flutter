import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// import 'app/commons/adapters/storage/storage_client.dart';
// import 'app/modules/auth/presentation/auth_page.dart';
// import 'app/modules/home/presentation/home.dart';
// import 'app_module.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   // Initialize Modular with the AppModule
//   await Modular.init(AppModule());

//   // Retrieve the storage client
//   final storage = Modular.get<IStorageClient<String>>();

//   // Retrieve user data from storage
//   final userData = await storage.getData();

//   // Determine the initial route based on the presence of user data
//   final initialRoute = userData != null ? '/home' : '/';

//   // Run the app with the determined initial route
//   runApp(ModularApp(initialRoute: initialRoute));
// }
