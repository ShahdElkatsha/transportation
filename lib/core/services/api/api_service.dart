import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'api_errors.dart';
// import 'package:either_dart/either.dart';


class ApiService  {
  static final BaseOptions _baseOptions = BaseOptions(
    headers: {
      'lang': 'ar',
      'Content-Type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 5),
  );
  final Dio _dio = Dio(_baseOptions);

  ApiService([String? baseUrl]) {
    if (kDebugMode) {
      (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()..badCertificateCallback = (cert, host, port) => true;
    }
    if (baseUrl != null) {
      _dio.options.baseUrl = baseUrl;
    }
  }

  Future<Either<Failure, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      var response = await _dio.get(
        endPoint,
        data: body,
        queryParameters: query,
        options: options,
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(ServerFailure.handleNetworkErrorType(error));
    }
  }
  Future<Either<Failure, dynamic>> post({
    required String endPoint,
    dynamic body,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      var response = await _dio.post(
        endPoint,
        data: body,
        queryParameters: query,
        options: options,

      );
      return Right(response.data);
    } on DioException catch (error) {
      print(error);
      return Left(ServerFailure.handleNetworkErrorType(error));
    }
  }

  Future<dynamic> put({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      var response = await _dio.put(
        endPoint,
        data: body,
        queryParameters: query,
        options: options,
      );
      return response.data;
    } on DioException catch (error) {
      throw ServerFailure.handleNetworkErrorType(error);
    }
  }

  Future<dynamic> delete(
      {required String endPoint,
        Map<String, dynamic>? body,
        Map<String, dynamic>? query,
        Options? options}) async {
    try {
      var response = await _dio.delete(
        endPoint,
        data: body,
        queryParameters: query,
        options: options,
      );
      return response.data;
    } on DioException catch (error) {
      throw ServerFailure.handleNetworkErrorType(error);
    }
  }
}