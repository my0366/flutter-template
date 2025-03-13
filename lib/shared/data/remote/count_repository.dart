import 'package:flutter_template/shared/data/dio_instance.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_repository.g.dart';

@Riverpod(keepAlive: true)
CountRepository testRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return CountRepository(dio: dio);
}

class CountRepository {
  final Dio dio;

  CountRepository({required this.dio});

  /// 예제에서는 1을 반환하도록 합니다.
  Future<dynamic> getCounts() async {
    /// 실제 API 호출시 사용 (예시)
    // return DioClient.request(
    //   dio: dio,
    //   method: HttpMethod.get,
    //   path: "/post",
    // );
    return Future.delayed(Duration(seconds: 1)).then((value) => 1);
  }
}
