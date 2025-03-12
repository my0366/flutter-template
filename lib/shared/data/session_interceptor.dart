import 'package:app_boilerplate/shared/data/local/session_storage.dart';
import 'package:app_boilerplate/shared/utili/dev_log.dart';
import 'package:dio/dio.dart';

class SessionInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.d("SessionInterceptor onRequest >> ${response.requestOptions.uri}");
    super.onResponse(response, handler);
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    Log.d("SessionInterceptor onRequest >> ${options.uri}");
    options.headers['Authorization'] = "Bearer ${await SessionStorage.getAccessToken()}";
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    //:Todo implement 401 Error
  }
}
