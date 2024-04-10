import '../../interfaces/infrastructure/navigation_arguments.dart';
import '../utils/utils.dart';
import 'mvvm.dart';

/// A mixin to inject a [ViewModel] into a page/widget
///
/// See also:
///
///  * [ViewState], which disposes the [ViewModel] when the widget is disposed.
mixin View<VM extends ViewModel> {
  /// Get the injected [ViewModel]
  final VM viewModel = dependencyManager.get<VM>();

  /// Get the current [NavigationArguments]
  final NavigationArguments args = navigation.args;
}
