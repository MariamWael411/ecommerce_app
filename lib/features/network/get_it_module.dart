import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_client.dart';
import 'api_constant.dart';

@module
abstract class GetItModule {
  @lazySingleton
  BaseOptions get baseOptions => BaseOptions(baseUrl: ApiConstant.baseUrl);

  @lazySingleton
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
    requestHeader: true,
    responseHeader: true,
    requestBody: true,
  );

  @lazySingleton
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @lazySingleton
  Connectivity get provideConnectivity => Connectivity();

  @lazySingleton
  ApiClient get provideApiClient =>
      ApiClient(provideDio(baseOptions, prettyDioLogger));
}
