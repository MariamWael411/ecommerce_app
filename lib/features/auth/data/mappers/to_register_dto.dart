import 'package:ecommerce/features/auth/data/models/request/register/register_request_dto.dart';
import 'package:ecommerce/features/auth/domain/entities/request/register/register_request.dart';

extension RegisterDto on RegisterRequest {
  RegisterRequestDto toRegisterDto() {
    return RegisterRequestDto(
      email: email,
      password: password,
      name: name,
      phone: phone,
      rePassword: rePassword,
    );
  }
}
