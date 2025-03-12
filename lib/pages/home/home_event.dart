import 'package:flutter_template/features/count/count_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeEvent {
  void fetchCount(WidgetRef ref) => ref.read(countNotifierProvider.notifier).fetchCount();
  void increment(WidgetRef ref) => ref.read(countNotifierProvider.notifier).increment();
  void decrement(WidgetRef ref) => ref.read(countNotifierProvider.notifier).decrement();
}
