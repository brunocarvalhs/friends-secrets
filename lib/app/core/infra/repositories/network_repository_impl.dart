import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/domain/repositories/network_repository.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final NetworkDataSource dataSource;

  NetworkRepositoryImpl(this.dataSource);

  @override
  Future<Either<Exception, Response<T>>> delete<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final result = await dataSource.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return Right(result);
    } catch (e) {
      _exception(e);
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, Response<T>>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final result = await dataSource.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(result);
    } catch (e) {
      _exception(e);
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, Response<T>>> head<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final result = await dataSource.head<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return Right(result);
    } catch (e) {
      _exception(e);
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, Response<T>>> patch<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final result = await dataSource.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(result);
    } catch (e) {
      _exception(e);
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, Response<T>>> post<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final result = await dataSource.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(result);
    } catch (e) {
      _exception(e);
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, Response<T>>> put<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final result = await dataSource.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(result);
    } catch (e) {
      _exception(e);
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, void>> setToken(String token) async {
    try {
      final result = dataSource.setToken(token);
      return Right(result);
    } catch (e) {
      _exception(e);
      return Left(Exception(e));
    }
  }

  void _exception(exception) {
    if (Modular.get<FirebaseCrashlytics>().isCrashlyticsCollectionEnabled) {
      Modular.get<FirebaseCrashlytics>()
          .setCustomKey("Exception", exception.toString());
      Modular.get<FirebaseCrashlytics>()
          .setUserIdentifier("${Modular.get<AuthStore>().user?.id}");
    }
  }
}
