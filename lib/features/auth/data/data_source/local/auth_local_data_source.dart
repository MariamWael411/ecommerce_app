import 'package:ecommerce/core/cache/shared_prefernces/shared_preferences_utils.dart';
import 'package:ecommerce/features/network/models/response/auth/auth_responce_dto.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken({
    required SharedPreferencesUtils preferenceUtils,
    required AuthResponceDto responce,
  });
}
