import 'package:ecommerce/features/auth/domain/entities/request/login/login_request.dart';
import 'package:ecommerce/features/auth/domain/entities/request/register/register_request.dart';

import '../../../network/api/api_result.dart';

abstract class AuthRepository {
  Future<ApiResult<void>> login(LoginRequest loginRequest);

  Future<ApiResult<void>> register(RegisterRequest registerRequest);
}
