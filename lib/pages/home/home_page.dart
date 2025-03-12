import 'package:flutter_template/pages/home/home_event.dart';
import 'package:flutter_template/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
              "Count : ${count(ref)}",
              style: ShadTheme.of(context).textTheme.h2,
            ),
            Gap(16),
            ShadButton(
              width: double.infinity,
              onPressed: () => fetchCount(ref),
              child: Text('Fetch Count'),
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ShadButton(
                    onPressed: () => increment(ref),
                    child: Text('+'),
                  ),
                ),
                Expanded(
                  child: ShadButton(
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
