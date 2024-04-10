import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'mvvm.dart';

/// An abstract class to inject a [ViewModel] into a page/widget
/// and dispose the [ViewModel] when the widget is disposed.
///
/// IMPORTANT: [ViewState] should only be used by the feature's main page.
/// If used in an internal widget, may cause unexpected errors.
///
/// See also:
///
///  * [[View]], which attaches the [ViewModel] and does not disposes it.
///  The disposal is done when the Module is disposed.
abstract class ViewState<S extends StatefulWidget, M extends ViewModel>
    extends State<S> {
  /// Injected ViewModel
  late final M viewModel;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    viewModel = dependencyManager.get<M>();
  }

  @override
  void dispose() {
    super.dispose();
    final isDisposed = dependencyManager.dispose<M>();
    if (isDisposed) {
      return;
    }
  }
}
