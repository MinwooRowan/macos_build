// Package imports:
import 'package:exe_test/core/util/logger_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    logger.i(
        '[Porovider Logger]: ${provider.name ?? provider.runtimeType} didUpdateProvider / pv: $previousValue / nv: $newValue');
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    logger.i(
        '[Porovider Logger]: ${provider.name ?? provider.runtimeType} didAddProvider / value : $value');
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    logger.i(
        '[Porovider Logger]: ${provider.name ?? provider.runtimeType} didDisposeProvider');
  }
}
