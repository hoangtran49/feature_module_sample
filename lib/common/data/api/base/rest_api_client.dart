// import 'package:ddd_arch/common/data/api/base/dio_builder.dart';
// import 'package:dio/dio.dart';

// enum RestMethod { get, post, put, patch, delete }

// typedef Decoder<T> = T Function(Map<String, dynamic> data);

// class RestApiClient {
//   RestApiClient({
//     this.baseUrl = '',
//     this.interceptors = const [],
//     this.errorResponseMapperType = ErrorResponseMapperType.jsonObject,
//     this.successResponseMapperType = SuccessResponseMapperType.dataJsonObject,
//     this.connectTimeoutInMs = 15000,
//     this.sendTimeoutInMs = 15000,
//     this.receiveTimeoutInMs = 15000,
//   }) : _dio = DioBuilder.createDio(
//           options: BaseOptions(
//             baseUrl: baseUrl,
//             connectTimeout: connectTimeoutInMs,
//             receiveTimeout: receiveTimeoutInMs,
//             sendTimeout: sendTimeoutInMs,
//           ),
//         );

//   final SuccessResponseMapperType successResponseMapperType;
//   final ErrorResponseMapperType errorResponseMapperType;
//   final String baseUrl;
//   final int? connectTimeoutInMs;
//   final int? sendTimeoutInMs;
//   final int? receiveTimeoutInMs;
//   List<Interceptor> interceptors;
//   final Dio _dio;

//   Future<T> request<T, D>({
//     required RestMethod method,
//     required String path,
//     Map<String, dynamic>? queryParameters,
//     Decoder<D>? decoder,
//     dynamic body,
//     SuccessResponseMapperType? successResponseMapperType,
//     ErrorResponseMapperType? errorResponseMapperType,
//     Map<String, dynamic>? headers,
//     String? contentType,
//     ResponseType? responseType,
//     int? sendTimeoutInMs,
//     int? receiveTimeoutInMs,
//   }) async {
//     try {
//       final reponse = await _requestByMethod(
//           method: method,
//           path:
//               path.startsWith(baseUrl) ? path.substring(baseUrl.length) : path,
//           queryParameters: queryParameters,
//           body: body,
//           options: Options(
//             headers: headers,
//             contentType: contentType,
//             responseType: responseType,
//             sendTimeout: sendTimeoutInMs,
//             receiveTimeout: receiveTimeoutInMs,
//           ));
//     } catch (error) {}
//   }

//   Future<Response> _requestByMethod({
//     required RestMethod method,
//     required String path,
//     Map<String, dynamic>? queryParameters,
//     // ignore: avoid-dynamic
//     dynamic body,
//     Options? options,
//   }) {
//     switch (method) {
//       case RestMethod.get:
//         return _dio.get(
//           path,
//           queryParameters: queryParameters,
//           options: options,
//         );
//       case RestMethod.post:
//         return _dio.post(
//           path,
//           data: body,
//           queryParameters: queryParameters,
//           options: options,
//         );
//       case RestMethod.patch:
//         return _dio.patch(
//           path,
//           data: body,
//           queryParameters: queryParameters,
//           options: options,
//         );
//       case RestMethod.put:
//         return _dio.put(
//           path,
//           data: body,
//           queryParameters: queryParameters,
//           options: options,
//         );
//       case RestMethod.delete:
//         return _dio.delete(
//           path,
//           data: body,
//           queryParameters: queryParameters,
//           options: options,
//         );
//     }
//   }
// }

// enum ErrorResponseMapperType {
//   jsonObject,
//   jsonArray,
//   line,
//   twitter,
//   goong,
//   firebaseStorage,
// }

// enum SuccessResponseMapperType {
//   dataJsonObject,
//   dataJsonArray,
//   jsonObject,
//   jsonArray,
//   // recordsJsonArray,
//   // resultsJsonArray,
// }
