import '../../dependency_manager/modular_dependency_manager.dart';
import '../../interfaces/infrastructure/dependency_manager.dart';
import '../../interfaces/infrastructure/navigation.dart';
import '../../navigation/modular_navigation.dart';

///
/// Provides a static access to a singleton that implements [Navigation]
///
final Navigation navigation = ModularNavigation.i();

///
/// Provides a static access to a singleton that implements [DependencyManager]
///
final DependencyManager dependencyManager = ModularDependencyManager.i();
