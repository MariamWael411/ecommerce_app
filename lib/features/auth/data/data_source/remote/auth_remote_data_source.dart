import '../../../../network/api/api_result.dart';
import '../../../../network/models/request/login/login_request_dto.dart';
import '../../../../network/models/request/register/register_request_dto.dart';
import '../../../../network/models/response/auth/auth_responce_dto.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResult<AuthResponceDto>> login(LoginRequestDto loginRequest);

  Future<ApiResult<AuthResponceDto>> register(
    RegisterRequestDto registerRequest,
  );
}
