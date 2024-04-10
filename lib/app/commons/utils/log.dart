import 'dart:io';

import 'package:logger/logger.dart';

//
/// App logging utils.
///
abstract class Log {
  static final _logger = Logger(
    printer: Platform.isIOS ? PrettyPrinter(colors: false) : null,
  );

  static bool _isTest() {
    return Platform.environment.containsKey('FLUTTER_TEST');
  }

  /// Info level
  static void i(Object? message, [dynamic data]) {
    if (!_isTest()) {
      _logger.i(message, error: data);
    }
  }

  /// Debug level
  static void d(Object? message, [dynamic data]) {
    if (!_isTest()) {
      _logger.d(message, error: data);
    }
  }

  /// Verbose level
  static void t(Object? message, [dynamic data]) {
    if (!_isTest()) {
      _logger.t(message, error: data);
    }
  }

  /// Warning level
  static void w(Object? message, [dynamic data]) {
    if (!_isTest()) {
      _logger.w(message, error: data);
    }
  }

  /// Error level
  static void e(Object? message, [dynamic error, StackTrace? stackTrace]) {
    if (!_isTest()) {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
  }
}
