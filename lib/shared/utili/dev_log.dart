import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// {@category Util}
class Log {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, errorMethodCount: 5, lineLength: 80, colors: true, printEmojis: true),
  );

  /// for debug. connection, data logs
  static void d(String text) {
    if (!kReleaseMode) {
      _logger.d(text);
    }
  }

  /// class lifecycle, method call
  static void i(String text) {
    if (!kReleaseMode) {
      _logger.i(text);
    }
  }

  /// except case but not error
  static void w(String text) {
    if (!kReleaseMode) {
      _logger.w(text);
    }
  }

  /// runtime error / exception
  static void e(dynamic exception, StackTrace stack, {String? text}) {
    if (!kReleaseMode) {
      if (text != null && text.isNotEmpty) {
        _logger.e(text);
      }
      _logger.e(exception, error: exception, stackTrace: stack);
    }
  }
}

class OtherException implements Exception {
  String cause;

  OtherException(this.cause);

  @override
  String toString() {
    return cause;
  }
}
