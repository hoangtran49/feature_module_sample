import 'package:dio/dio.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio({
    BaseOptions? options,
  }) {
    return Dio(
      BaseOptions(
        baseUrl: options?.baseUrl ?? '',
        connectTimeout: options?.connectTimeout ?? 15000,
        receiveTimeout: options?.receiveTimeout ?? 15000,
        sendTimeout: options?.sendTimeout ?? 15000,
      ),
    );
  }
}
