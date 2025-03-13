import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/pages/home/home_event.dart';
import 'package:flutter_template/pages/home/home_state.dart';
import 'package:gap/gap.dart';

class HomePage extends ConsumerWidget with HomeState, HomeEvent {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              key: const Key('count_text'),
              "Count : ${count(ref)}",
            ),
            Gap(16),
            ElevatedButton(
              onPressed: () => fetchCount(ref),
              child: Text('Fetch Count'),
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => increment(ref),
                    child: Text('+'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => decrement(ref),
                    child: Text('-'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
