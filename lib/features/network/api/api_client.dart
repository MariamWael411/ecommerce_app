import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/request/login/login_request_dto.dart';
import '../models/request/register/register_request_dto.dart';
import '../models/response/auth/auth_responce_dto.dart';
import 'end_point.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST(EndPoint.signIn)
  Future<AuthResponceDto> login(@Body() LoginRequestDto loginRequest);

  @POST(EndPoint.signUp)
  Future<AuthResponceDto> register(@Body() RegisterRequestDto registerRequest);
}
