import 'package:ecommerce/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:ecommerce/features/auth/domain/entities/request/login/login_request.dart';

extension loginDto on LoginRequest {
  LoginRequestDto toLoginDto() {
    return LoginRequestDto(email: email, password: password);
  }
}
