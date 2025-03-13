import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appProvider = NotifierProvider<AppProvider, ThemeMode>(() {
  return AppProvider();
});

class AppProvider extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.system; // 기본값은 시스템 설정을 따름
  }

  void toggleTheme() {
    state = (state == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
  }
}
