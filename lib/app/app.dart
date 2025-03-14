import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      builder: (context, child) => Overlay(
        initialEntries: [
          if (child != null)
            OverlayEntry(
              builder: (context) => child,
            ),
        ],
      ),
      routerConfig: router,
      restorationScopeId: 'app',
    );
  }
}
