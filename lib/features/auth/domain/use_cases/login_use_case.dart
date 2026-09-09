import 'package:ecommerce/features/auth/domain/entities/request/login/login_request.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/api/api_result.dart';

@lazySingleton
class LoginUseCase {
  AuthRepository _authRepository;

  LoginUseCase({required this._authRepository});

  Future<ApiResult<void>> call(LoginRequest loginRequest) {
    return _authRepository.login(loginRequest);
  }
}
