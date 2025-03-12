import 'package:flutter_template/features/count/count_state.dart';
import 'package:flutter_template/shared/data/remote/count_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_provider.g.dart';

@riverpod
class CountNotifier extends _$CountNotifier {
  @override
  CountState build() {
    return CountState();
  }

  Future<dynamic> fetchCount() async {
    final result = await ref.read(testRepositoryProvider).getCounts();
    state = state.copyWith(count: result);
    return result;
  }

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  void decrement() {
    state = state.copyWith(count: state.count - 1);
  }
}
