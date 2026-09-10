import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/core/cache/shared_prefernces/shared_preferences_utils.dart';
import 'package:ecommerce/core/errors/app_error.dart';
import 'package:ecommerce/core/utils/connectivity_extention.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/mappers/to_login_dto.dart';
import 'package:ecommerce/features/auth/data/mappers/to_register_dto.dart';
import 'package:ecommerce/features/auth/domain/entities/request/login/login_request.dart';
import 'package:ecommerce/features/auth/domain/entities/request/register/register_request.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/api/api_result.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource _authRemoteDataSource;
  AuthLocalDataSource _authLocalDataSource;
  Connectivity _connectivity;
  SharedPreferencesUtils _preferencesUtils;

  AuthRepositoryImpl({
    required this._authRemoteDataSource,
    required this._connectivity,
    required this._preferencesUtils,
    required this._authLocalDataSource
  });

  @override
  Future<ApiResult<void>> login(LoginRequest loginRequest) async {
    if (await _connectivity.isConnected()) {
      var apiResult = await _authRemoteDataSource.login(
          loginRequest.toLoginDto());
      if (apiResult.isSuccess && apiResult.getData.token != null) {
        //todo:save token
        // _preferencesUtils.saveData(key: 'token', value: apiResult.getData.token);
        _authLocalDataSource.saveToken(
            preferenceUtils: _preferencesUtils, responce: apiResult.getData);
        return apiResult;
      } else {
        return apiResult;
        //return ErrorApiResult(errorMessage: ServerError());
      }
    }
    return ErrorApiResult(errorMessage: NetworkError());
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest registerRequest) async {
    if (await _connectivity.isConnected()) {
      var apiResult = await _authRemoteDataSource.register(
          registerRequest.toRegisterDto());
      if (apiResult.isSuccess && apiResult.getData.token != null) {
        //todo:save token
        _preferencesUtils.saveData(
            key: 'token', value: apiResult.getData.token);
        return apiResult;
      } else {
        return apiResult;
        // return ErrorApiResult(errorMessage: ServerError());
      }

    }
    return ErrorApiResult(errorMessage: NetworkError());
  }
}
