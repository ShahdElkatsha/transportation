import 'dart:io';
import 'package:dio/dio.dart';

import 'network_exceptions.dart';
// import 'package:e_commerce/core/services/api/network_exception_handler.dart';
abstract class Failure {
  final DioExceptionType exceptionType;
  final int? statusCode;
  final NetworkExpMsgCode expMsgCode;
  Failure(
      this.expMsgCode,
      this.statusCode,
      this.exceptionType,
      );
}

class ServerFailure extends Failure {
  ServerFailure(
      super.expMsgCode,
      super.statusCode,
      super.exceptionType,
      );
  factory ServerFailure.handleNetworkErrorType(DioException dioException) {
    if (dioException.type is NetworkTimeoutExceptions) {
      return ServerFailure.fromTimeout(dioException);
    }
    if (dioException.type == DioExceptionType.badResponse) {
      return ServerFailure.fromBadResponse(dioException);
    }
    if (dioException.error is SocketException) {
      return ServerFailure.fromNetwork(dioException);
    }
    return ServerFailure.fromUnkown(dioException);
  }

  factory ServerFailure.fromBadResponse(DioException dioException) =>
      ServerFailure(
        NetworkExpMsgCode.badResponseExpCode,
        dioException.response?.statusCode,
        DioExceptionType.badResponse,
      );

  factory ServerFailure.fromTimeout(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          NetworkExpMsgCode.noInternetConnectionExpCode,
          dioException.response?.statusCode,
          DioExceptionType.sendTimeout,
        );
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          NetworkExpMsgCode.noInternetConnectionExpCode,
          dioException.response?.statusCode,
          DioExceptionType.connectionTimeout,
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          NetworkExpMsgCode.noInternetConnectionExpCode,
          dioException.response?.statusCode,
          DioExceptionType.receiveTimeout,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          NetworkExpMsgCode.noInternetConnectionExpCode,
          dioException.response?.statusCode,
          DioExceptionType.cancel,
        );
      default:
        return ServerFailure.fromUnkown(dioException);
    }
  }
  factory ServerFailure.fromUnkown(DioException dioException) => ServerFailure(
    NetworkExpMsgCode.unKnowingExpCode,
    dioException.response?.statusCode,
    DioExceptionType.unknown,
  );
  factory ServerFailure.fromNetwork(DioException dioException) => ServerFailure(
    NetworkExpMsgCode.unKnowingExpCode,
    dioException.response?.statusCode,
    DioExceptionType.connectionError,
  );
}