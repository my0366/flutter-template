import 'package:flutter_template/features/count/count_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeStateTest {
  int count(ProviderContainer container) => container.read(countNotifierProvider).count;
}
