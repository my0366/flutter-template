import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/app/app.dart';
import 'package:flutter_template/shared/utili/permission_util.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await _checkPermissions();

  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

Future<void> _checkPermissions() async {
  await Future.delayed(Duration(seconds: 2));
  PermissionManager.requestAllPermissions();

  bool notification = await PermissionManager.isPermissionGranted(Permission.notification);
  if (notification) {
    print("모든 권한 허용");
  } else {
    print("권한 허용 안됨");
  }

  FlutterNativeSplash.remove();
}
