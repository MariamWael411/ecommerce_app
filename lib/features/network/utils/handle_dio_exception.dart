import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/app_error.dart';
import 'package:ecommerce/features/network/api/api_result.dart';

ErrorApiResult<T> handleDioException<T>(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError ||
        DioExceptionType.connectionTimeout ||
        DioExceptionType.receiveTimeout ||
        DioExceptionType.sendTimeout:
      return ErrorApiResult(errorMessage: NetworkError());
    case DioExceptionType.badResponse:
      final error =
          e.response?.data['errors']?['msg'] ?? e.response?.data['message'];
      return ErrorApiResult(errorMessage: ServerError(error: error));
    default:
      return ErrorApiResult(errorMessage: UnKnownError());
  }
}
