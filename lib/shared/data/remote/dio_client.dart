import 'package:flutter_template/shared/data/local/constant.dart';
import 'package:dio/dio.dart';

enum HttpMethod { get, post, patch, put, delete }

class DioClient {
  static String getUri(String path) {
    return "${Const.proxyAddress}$path";
  }

  static Future<dynamic> request({
    required Dio dio,
    required HttpMethod method,
    required String path,
    dynamic body,
  }) async {
    final uri = getUri(path);
    try {
      Response response;
      switch (method) {
        case HttpMethod.get:
          response = await dio.get(uri);
          break;
        case HttpMethod.post:
          response = await dio.post(uri, data: body);
          break;
        case HttpMethod.patch:
          response = await dio.patch(uri, data: body);
          break;
        case HttpMethod.put:
          response = await dio.put(uri, data: body);
          break;
        case HttpMethod.delete:
          response = await dio.delete(uri, data: body);
          break;
      }
      return response.data;
    } catch (e) {
      if (e is DioException) {
        return e.response?.data;
      } else {
        return e;
      }
    }
  }
}
