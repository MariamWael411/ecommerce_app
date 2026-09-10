import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/app_error.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/network/utils/handle_dio_exception.dart';
import 'package:injectable/injectable.dart';

import '../../../../network/api/api_client.dart';
import '../../../../network/api/api_result.dart';
import '../../../../network/models/request/login/login_request_dto.dart';
import '../../../../network/models/request/register/register_request_dto.dart';
import '../../../../network/models/response/auth/auth_responce_dto.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiClient _apiClient;

  AuthRemoteDataSourceImpl({required this._apiClient});

  @override
  Future<ApiResult<AuthResponceDto>> login(LoginRequestDto loginRequest) async {
    try {
      var response = await _apiClient.login(loginRequest);
      return SuccessApiResult(data: response);
    } on DioException catch (e) {
      // String error = e.response?.data['message'];
      // return ErrorApiResult(errorMessage: ServerError(error: error));
      return handleDioException(e);
    } catch (e) {
      return ErrorApiResult(errorMessage: UnKnownError());
    }
  }

  @override
  Future<ApiResult<AuthResponceDto>> register(
    RegisterRequestDto registerRequest,
  ) async {
    try {
      var response = await _apiClient.register(registerRequest);
      return SuccessApiResult(data: response);
    } on DioException catch (e) {
      // final errorMessage = e.response?.data['errors']?['msg'] ?? e.response?.data['message']??'something went wrong';
      // return ErrorApiResult(errorMessage: ServerError(error: errorMessage));
      return handleDioException(e);
    } catch (e) {
      return ErrorApiResult(errorMessage: UnKnownError());
    }
  }
}
