import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/core/errors/app_error.dart';
import 'package:ecommerce/core/utils/connectivity_extention.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/mappers/to_login_dto.dart';
import 'package:ecommerce/features/auth/data/mappers/to_register_dto.dart';
import 'package:ecommerce/features/auth/domain/entities/request/login/login_request.dart';
import 'package:ecommerce/features/auth/domain/entities/request/register/register_request.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/api_result.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource _authRemoteDataSource;
  Connectivity _connectivity;

  AuthRepositoryImpl({
    required this._authRemoteDataSource,
    required this._connectivity,
  });

  @override
  Future<ApiResult<void>> login(LoginRequest loginRequest) async {
    if (await _connectivity.isConnected()) {
      return _authRemoteDataSource.login(loginRequest.toLoginDto());
    }
    return ErrorApiResult(errorMessage: NetworkError());
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest registerRequest) async {
    if (await _connectivity.isConnected()) {
      return _authRemoteDataSource.register(registerRequest.toRegisterDto());
    }
    return ErrorApiResult(errorMessage: NetworkError());
  }
}
