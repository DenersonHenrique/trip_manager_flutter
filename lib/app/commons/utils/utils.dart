import '../helpers/dependency_manager/modular_dependency_manager.dart';
import '../helpers/interfaces/infrastructure/dependency_manager.dart';
import '../helpers/interfaces/infrastructure/navigation.dart';
import '../helpers/navigation/modular_navigation.dart';

///
/// Provides a static access to a singleton that implements [Navigation]
///
final Navigation Nav = ModularNavigation.i();

///
/// Provides a static access to a singleton that implements [DependencyManager]
///
final DependencyManager DM = ModularDependencyManager.i();
