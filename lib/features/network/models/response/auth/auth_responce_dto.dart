import 'package:ecommerce/features/network/models/response/auth/user_responce_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_responce_dto.g.dart';

@JsonSerializable()
class AuthResponceDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;
  @JsonKey(name: "token")
  final String? token;

  AuthResponceDto({this.message, this.user, this.token});

  factory AuthResponceDto.fromJson(Map<String, dynamic> json) {
    return _$AuthResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthResponceDtoToJson(this);
  }
}
