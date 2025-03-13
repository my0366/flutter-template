import 'package:flutter_test/flutter_test.dart';

import '../create_container.dart';
import 'home_event_test.dart';
import 'home_state_test.dart';

void main() {
  final homeEvent = HomeEventTest();
  final homeState = HomeStateTest();

  test('Increment', () {
    final container = createContainer();
    homeEvent.increment(container);
    expect(homeState.count(container), 1);
  });

  test('Decrement', () {
    final container = createContainer();
    homeEvent.decrement(container);
    expect(homeState.count(container), -1);
  });

  test('Increment -> Decrement', () {
    final container = createContainer();
    homeEvent.increment(container);
    homeEvent.decrement(container);
    expect(homeState.count(container), 0);
  });
}
