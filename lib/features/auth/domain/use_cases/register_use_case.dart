import 'package:ecommerce/features/auth/domain/entities/request/register/register_request.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/api/api_result.dart';

@lazySingleton
class RegisterUseCase {
  AuthRepository _authRepository;

  RegisterUseCase({required this._authRepository});

  Future<ApiResult<void>> call(RegisterRequest registerRequest) {
    return _authRepository.register(registerRequest);
  }
}
