import 'package:flutter_template/shared/data/session_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'local/constant.dart';

part 'dio_instance.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  Dio dio = Dio();
  final options = BaseOptions(
    baseUrl: Const.proxyAddress,
    responseType: ResponseType.json,
    headers: {"Content-Type": "application/json"},
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
  dio.options = options;
  dio.interceptors.add(SessionInterceptor());
  return dio;
}
