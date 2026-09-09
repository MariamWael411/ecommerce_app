import 'package:ecommerce/core/cache/shared_prefernces/shared_preferences_utils.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../network/models/response/auth/auth_responce_dto.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> saveToken({
    required SharedPreferencesUtils preferenceUtils,
    required AuthResponceDto responce,
  }) {
    // TODO: implement saveToken
    return preferenceUtils.saveData(key: 'token', value: responce.token);
  }
}
