import 'package:flutter_template/pages/home/home_event.dart';
import 'package:flutter_template/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget with HomeState, HomeEvent {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count: ${count(ref)}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => fetchCount(ref),
              child: Text('Fetch Count'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => increment(ref),
                  child: Text('+'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => decrement(ref),
                  child: Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
