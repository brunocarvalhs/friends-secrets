import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tf_dio_cache/dio_http_cache.dart';

class DioDataSourceImpl extends NetworkDataSource {
  final Dio http;
  final SharedPreferences sharedPreferences;
  final DioCacheManager dioCacheManager;

  DioDataSourceImpl(this.http, this.sharedPreferences, this.dioCacheManager) {
    setupCache();
  }

  late String token = 'Bearer ';

  void setupCache() {
    http.interceptors.add(dioCacheManager.interceptor);
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return http.delete<T>(
      path,
      data: jsonEncode(data),
      queryParameters: queryParameters,
      options: options ??
          Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: token,
          }),
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    http.interceptors.add(DioCacheManager(CacheConfig(baseUrl: "http://www.google.com")).interceptor);
    return http.get<T>(
      path,
      queryParameters: queryParameters,
      options: options ??
          Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: token,
          }),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<T>> head<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return http.head<T>(
      path,
      data: jsonEncode(data),
      queryParameters: queryParameters,
      options: options ??
          Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: token,
          }),
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return http.patch<T>(
      path,
      data: jsonEncode(data),
      queryParameters: queryParameters,
      options: options ??
          Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: token,
          }),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return http.post<T>(
      path,
      data: jsonEncode(data),
      queryParameters: queryParameters,
      options: options ??
          Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: token,
          }),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return http.put<T>(
      path,
      data: jsonEncode(data),
      queryParameters: queryParameters,
      options: options ??
          Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: token,
          }),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  void setToken(String token) {
    this.token = 'Bearer $token';
    http.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  String getToken() {
    return token;
  }

  @override
  Options buildCache() => buildCacheOptions(const Duration(days: 7), forceRefresh: true);
}
