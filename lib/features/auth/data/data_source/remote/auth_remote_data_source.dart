import 'package:ecommerce/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:ecommerce/features/auth/data/models/request/register/register_request_dto.dart';
import 'package:ecommerce/features/auth/data/models/response/auth/auth_responce_dto.dart';

import '../../../../network/api_result.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResult<AuthResponceDto>> login(LoginRequestDto loginRequest);

  Future<ApiResult<AuthResponceDto>> register(
    RegisterRequestDto registerRequest,
  );
}
