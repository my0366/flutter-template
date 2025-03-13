import 'package:flutter_template/features/count/count_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeEventTest {
  void fetchCount(ProviderContainer container) => container.read(countNotifierProvider.notifier).fetchCount();
  void increment(ProviderContainer container) => container.read(countNotifierProvider.notifier).increment();
  void decrement(ProviderContainer container) => container.read(countNotifierProvider.notifier).decrement();
}
