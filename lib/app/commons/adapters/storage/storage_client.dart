import 'dart:async';

import 'package:flutter/foundation.dart';

///
/// Handle data persistence in local storage
///
abstract class IStorageClient<T> {
  ///
  /// Delete data by [key]. If fails, throws a DeleteLocalStorageException
  ///
  FutureOr<void> delete(String key);

  ///
  /// Save data, indexed by [key]. If fails, throws a SaveLocalStorageException
  ///
  FutureOr<void> save(String key, T value);

  ///
  /// read the data from storage. If fails, throws a
  /// FetchLocalStorageException
  ///
  FutureOr<dynamic> read(String key);

  /// Clear all the data from storage
  FutureOr<void> clear() {}

  ///
  /// Fetch a key.
  ///
  FutureOr<dynamic> readKey();

  /// Returns a [ValueListenable] which notifies its listeners when an entry
  /// in the box changes.
  ///
  /// If [keys] filter is provided, only changes to entries with the
  /// specified keys notify the listeners.
  FutureOr<ValueListenable> listenable({List<String>? keys}) {
    throw UnimplementedError();
  }
}
