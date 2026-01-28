import 'package:dio/dio.dart';

class ApiClient {
  late final Dio dio;

  ApiClient({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 15),
    Duration receiveTimeout = const Duration(seconds: 15),
    Map<String, dynamic>? defaultHeaders,
    List<Interceptor>? interceptors,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: defaultHeaders,
        responseType: ResponseType.json,
      ),
    );

    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }
  }

  /// Generic request
  Future<Response<T>> request<T>(
      String path, {
        required String method,
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      return await dio.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options?.copyWith(method: method) ??
            Options(method: method),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException {
      rethrow;
    }
  }

  /// Convenience methods
  Future<Response<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) =>
      request<T>(
        path,
        method: 'GET',
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response<T>> post<T>(
      String path, {
        Object? data,
        Options? options,
      }) =>
      request<T>(
        path,
        method: 'POST',
        data: data,
        options: options,
      );

  Future<Response<T>> put<T>(
      String path, {
        Object? data,
        Options? options,
      }) =>
      request<T>(
        path,
        method: 'PUT',
        data: data,
        options: options,
      );

  Future<Response<T>> delete<T>(
      String path, {
        Object? data,
        Options? options,
      }) =>
      request<T>(
        path,
        method: 'DELETE',
        data: data,
        options: options,
      );
}