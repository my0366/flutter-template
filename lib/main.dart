import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/app.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}
