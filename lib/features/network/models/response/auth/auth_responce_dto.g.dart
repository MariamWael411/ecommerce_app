// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponceDto _$AuthResponceDtoFromJson(Map<String, dynamic> json) =>
    AuthResponceDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AuthResponceDtoToJson(AuthResponceDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };
