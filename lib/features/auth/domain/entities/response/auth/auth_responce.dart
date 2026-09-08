import 'package:ecommerce/features/auth/domain/entities/response/auth/user_responce.dart';

class AuthResponce {
  final String? message;

  final User? user;

  final String? token;

  AuthResponce({this.message, this.user, this.token});
}
